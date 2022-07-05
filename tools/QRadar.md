# QRadar

## Xforece - Exchange：

https://exchange.xforce.ibmcloud.com/hub



## AQL 语言

-   如何查询该ip是否是内网网域：

    SELECT * FROM events WHERE INCIDR('192.0.2.0/24', sourceip)

-   
