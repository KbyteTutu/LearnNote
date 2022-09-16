# 背景

​		这次的bug来的很仓促，在版本结项前的最后一次测试时，这个bug突然就蹦出来了。表现的形式是程序对数据库的并发异步请求没有返回值。同时，全程没有抛出异常。

​		这个地方在之前的几次测试时并没有表现出这个错误情况，而且最近的几次更改并没有对这部分代码有任何实质性改动。对于仅有的改动，我经过测试，也确认没有影响到出错的地方。我大概花了一个小时从头追溯每个阶段的值，最终把问题定位到了我最不想出问题也最不熟悉的部分——基于aiohttp实现的高并发异步请求的部分。

​		背景上，这个程序限于版本原因只能使用python3.6.8开发，所以用了老版本的aiohttp，写法与新版本有所差异，但是我的bug并没有出在这个部分。

# Trouble Shooting

​		正常情况下，bug定位到地方，认真排查一下，问题也就出来了，但是这次有所不同。这次bug定位到模块之后，我发现了一个诡异的现象——这个bug并不是稳定复现的。同样的操作，我反复进行时，会有一定概率复现bug，而其他情况下一切正常。事情从这一刻开始有意思起来了。

​		这类情况 ，肯定是优先考虑网络问题的。但是由于我们所请求的对象是同机房的物理机，所以理论上网络连通性并不存在问题。当然我也不能直接排除这个选项，于是我想办法打开了目标机上的请求log，确认到我这边每次操作，目标机都能准确收到请求并正确返回。这时候其实已经基本排除了网络问题了。后续我又对代码逻辑做了改动，对异步请求的timeout做了修改，并没有改善bug。到这个地步，我决定对网络问题的排查暂时告一段落，因为后续的排查就需要借助工具抓包了，这显然成本较高。

​		暂时排除网络问题后，我开始考虑数据层面的问题。因为这次取到的数据实际上含有很多无序但是经过转义的字符串，自然而然地我想到了可能是response无法取到json结构体，进而导致无法取值，最终取空了。于是，为了排查这种可能性，我构造了一些特定数据进行测试。结果，我惊讶地发现，对于测试数据，一切正常，近百次测试都没有出现异常情况。难道定位到错误了？我喜滋滋地去把出问题的数据拿来进行转义测试，但是结果显而易见地不符合猜测：转义一切正常，json提取也一切正常。这其实不出所料，因为如果这个地方不正常，那之前应该百试百错，而不会存在任何执行成功的可能性。问题还是悬而未决。

​		继续定位问题。这个时候，我的思路大概定位在了aiohttp和asyncio并发请求的部分代码本身存在问题了。由于我着实对异步协程这块儿不熟悉，所以出问题也在预期之内。但是客观讲，我用正规编程方法弄来的代码（抄的google）不应该出大问题啊？这时候我翻出来之前写的demo，填入了出问题的数据，经过测试，发现问题果然复现了。依旧是有几率成功，大概率失败。哈，至少问题肯定在这块儿了！

# 问题demo

​		真正出问题的公司代码不方便贴出，但是这个demo倒是可以拿来说道说道。

```python
import asyncio, random
import aiohttp


async def producer(queue):
    for i in range(10000):
        await queue.put(
            "data"
        )


async def consumer(queue, q2):
    while True:
        cur = await queue.get()
        async with aiohttp.ClientSession() as session:
            payload = {
                "param": cur,
            }
            headers = {'Content-Type': 'application/json'}
            async with session.post(
                    'http://xxxx.xxx/xxxx',
                    json=payload,
                    headers=headers,
                    ssl=False) as resp:
                queue.task_done()
                await q2.put(await resp.text())


async def main():
    queue = asyncio.Queue()
    q2 = asyncio.Queue()
    producers = [asyncio.ensure_future(producer(queue)) for _ in range(3)]
    consumers = [asyncio.ensure_future(consumer(queue, q2)) for _ in range(10)]
    await asyncio.gather(*producers)
    await queue.join()

    for c in consumers:
        c.cancel()

    return q2

loop = asyncio.get_event_loop()
res = loop.run_until_complete(main())
print(res)
```

这个demo逻辑不困难，起一个生产者一个消费者，都是协程，生产者从queue里取数据，消费者处理掉然后丢到q2里面。开3个生产者，10个消费者，全部丢给loop调度。由于先gather 生产者的task，所以生产者会快一步，然后一切结束（queue.join())执行完成之后，取消掉消费者，返回结果。

其实，到这个份儿上，一行一行看代码也能找到问题了。表现是取不到数据，那直接定位到消费者函数里了。请求端有数据，那post也没问题……那，就剩下两行了

```
queue.task_done()
await q2.put(await resp.text())
```

乍一看这里， 生产者的任务这个时候已经结束了，请求都请求完了啊！标记一下任务结束可以继续下个队列很正常啊！

把结果丢进 q2也没错啊！很正常啊！

但是问题就是出在这两行代码里的。解决方法也很简单，就是把两者调换位置即可。

# 问题的原因

​		在调换了代码位置之后，异常状况消失了。显然，定位到这份上，肯定要把原因搞明白。

​		其实这时候情况已经渐渐明晰了，其实还是我对协程的理解不够深入。这部分代码，底层的任务调度是交给loop进行的，所以某种程度上讲，所有写着await的都可能被系统调度，都可能同步进行。我标记queue.task_done()的操作，实际上是告诉loop可以继续下一个任务了。这个时候，虽然我告诉loop执行下一个从queue里取数据的操作，但是问题是另一边异步执行的await q2.put(await resp.text())还没有完工呢！这时候，其实时间线如果拉长一些，数据也是能正常处理完毕的，但是坏就坏在，我在底下还写了一段取消消费者进程的代码。这本该是queue处理完成之后，去掉额外空待的消费者的代码，逻辑上没有问题。但是呢，在这个情况下，我相当于提前告诉loop，queue的任务结束了。那么，很显然，await q2.put(await resp.text())在跑完之前，我就下达了cancel的指令。这些指令的调度执行也是需要耗费时间的，所以在我以前的小demo里 ，cancel执行之前，那一两行的resp.text()早就被处理完了，所以问题被隐没了下去。而这回的测试环境中，resp的返回值很大，短时间内处理不完，所以问题暴露了出来。好巧不巧的是，这个数据的大小刚好在差不多临界的程度，所以他时灵时不灵——在系统处理的稍微快一点的时候，正常，慢一点的时候，无返回 。

​		而修复的逻辑，就是将task_done()字如其意地放到真正task_done的位置即可。这也算是人家给我的提示了，我确实是自己没想明白。queue.task_done()可不是await的，所以它会在上面await的代码执行完整之后再执行。这么一改，先await q2.put(await resp.text())，确保放好q2之后，再去进行下一个queue即可。

​		这确实是我对这部分逻辑理解不到位。说实话，到现在我也很难说我自己彻底理解了这个问题。后续遇到，我可能还是会犯错。我打算忙完最近这阵子，就好好看一下相关内容。到时候，没准儿上面我打的一大串内容都是错的呢……