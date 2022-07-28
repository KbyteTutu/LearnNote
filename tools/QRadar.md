# QRadar

## Xforece - Exchange：

https://exchange.xforce.ibmcloud.com/hub



## AQL 语言

-   如何查询该ip是否是内网网域：

    SELECT * FROM events WHERE INCIDR('192.0.2.0/24', sourceip)

-   进行按时间段的查询 select * from events start '2022-07-11 15:20' stop '2022-07-11 16:20'

    -   该查询如果查询的是已经过去的时间，则会异步互斥。比如查询3点到4点的日志，建立任务之后后续的查询并不会重复建立查询实例，只会在一个实例内进行搜索，而且后续的取值一致。
    -   如果查询未来的时间，则每次查询的时候都会重新建立任务

## 安装rpm 包

yum -y install PROTOCOL-Common-7.3-20180822130354.noarch.rpm



## 利用镜像及yum获得依赖包

