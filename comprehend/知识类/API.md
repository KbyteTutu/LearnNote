# API

> 应用编程接口（API）是一组用于构建和集成应用软件的定义和协议。

接口的作用是无需了解原理就可以让产品和其他服务或者产品互通。

分为私有接口和公用接口。可以开放资源的访问权限，并同时确保控制权在自家手里。

## Rest架构以及Rest Api

> 即Representational State Transfer的缩写。我对这个词组的翻译是"表现层状态转化"。

**用URL定位资源，用POST,GET,PUT,DELETE操作资源**
简单讲，就是限制用这种模式操作API。
![Restful api的意义](https://pica.zhimg.com/80/06ee404783540f0af299042057738a99_1440w.jpg?source=1940ef5c)

## Flask的Api

> The request object used by default in Flask. Remembers the matched endpoint and view arguments.
It is what ends up as request. If you want to replace the request object used you can subclass this and set request_class to your subclass.

[基于flask写一个简单api](https://www.cnblogs.com/baby123/p/14023538.html)
