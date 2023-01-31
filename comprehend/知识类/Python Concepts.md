# Python 理解

## 技巧

1. 如果结构里有某个功能不是必须的，最好用try..except处理。

    ​	具体来讲，就是类似某个逻辑流程中间有个不是很必要的下载，如果该下载出问题则会中断整个流程。用try except，except处加个info提示下载失败即可。不要写面向过程编程

2. list += 和append的区别

        ```python
         a = [1,1,1,1]
         a +=[2,2]
         结果a = [1, 1, 1, 1, 2, 2]
         
         a = [1,1,1,1]
         a.append([2,2])
         结果a = [1, 1, 1, 1, [2, 2]]
        ```

    

## 小知识

- python加减乘除 +-255以内都快，因为查表了

## [元类](https://www.bilibili.com/video/BV13F411g7CD?spm_id_from=333.999.0.0)

```python
class M(type):
    def __new__(cls,name,bases,dict):
        print("1234")
        return type.__new__(cls,name,bases,dict)
    
    def __init(self,name,bases,dict):
        print(name,bases,dict)
        return type.__init__(self,name,bases,dict)
   

class A(metaclass=M):
    pass
```

-  python类可以静态定义或者动态生成：

    - ```python
        class A():
        	pass
        
        A = type("A",(),{})
        ```

        python中一切都是对象，上面两种写法完全等价。定义A类实质上就是调用type函数去生成以A为名字，继承的父类，以及attributes就可以了。

- Metaclass就是为了去重新定义上面的type函数，就是**为了让开发者可以更灵活的掌握这个建立类的中间过程，可以让类在建立的时候就做一些操作**

- 当正常建立类的时候做不到大规模校验的时候，就可以以元类的形式去做。我理解的意思是，比如开发一堆接口，都希望进行广泛的参数校验，就可以用元类来完成。又或者需要动态生成类，需要进行类建立之前的审查。

## 不可变对象和可变对象

- 本质上没有差别。
- 在实际上，python只是限制了某个对象从python角度的改变,内存角度依然是可变的
- 在修改immutable对象时，只是把该变量引用向了另外的一个不可变对象。
