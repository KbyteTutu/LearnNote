# utterances

不得不说，老外在利用公共资源方面有一手的。。。

https://utteranc.es/

这个东西，实际上是一个使用js开发的用歪了github issue的工具。使用方法是，建立一个github的repo，然后在那个独立的repo里提issue，每个issue代表一个文章的评论区，然后issue的内容就是评论区的内容。简单，粗暴，高效利用了公开资源。

从某种意义上讲，还能滤掉一些无效的评论——即那些连github账号都没有，或者不知道怎么访问github的人，大概率也不能发出优质评论……

# 使用方法

非常简单，根据页面提示，选择主题或者其他选项（甚至贴心的提供了用Label方便你过滤掉这些issue的特性），然后拿到下面的js片段

```javascript
<script src="https://utteranc.es/client.js"
        repo="[ENTER REPO HERE]"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
```

下一步，就是找个html的地方把这段粘上去。

结束！

实际上，在我发现这个东西的应用场景里，我只是在外面包了个<body></body>就上阵了。效果很好！

# 实际效果

往下看，本文底下应该就是了。

# 思路扩展

我感觉，这个思路其实可以嫖到很多东西……这个不由得让我想起来那个利用了b站缓存,还有什么微博图床api的漏洞,进行文件分享的人。这其实思路上有点儿类似,但是毕竟那种还是一定程度上涉嫌利用漏洞牟利。这个使用的就是github的账号,也没有什么奇怪的东西,只是单纯的把评论列在那里,谁都可以看,反而顶多算得上是歪一点的利用罢了。

推而广之,是不是微博评论的api也可以这么搞？是不是内置几个机器人账号,然后在文本体内添加更多的内容鉴别机制,算不算另类的拿公网资源当数据库呢？

