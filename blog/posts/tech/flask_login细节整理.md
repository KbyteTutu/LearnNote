# 前言

最近因为小项目，重新撸登录模块，就搞来flask_login模块。真的好用！我参考说明编写的东西居然一次性成功~

https://www.cnblogs.com/ityouknow/p/12993209.html

这篇文章写的实例不错，虽然我的形式是数据库，但是整个逻辑上是通用的 。



同时我参考flask_login文档，也弄明白了几个细节，记录如下：

- 使用这段代码来对未登录页面进行限制

    - ```
        login_manager.login_view = "users.login"
        ```

- 关于什么时候要登录：
    - 使用login_required装饰器，标记路由即可



待续