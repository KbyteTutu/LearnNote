

# [RestClient相关功能](https://github.com/Huachao/vscode-restclient/)

将这个变量的所有功能一起讨论，是因为我觉得它太强大了。也是我选择它很重要的一个理由。

关于变量：

支持自定义变量和环境变量；

不同环境变量定义及环境切换功能；

共享变量；

可以将变量放在任何地方：URL、Header、body等；

获取其它请求的变量；

提供系统动态变量：

{{$guid}}
{{$randomInt min max}}
{{$timestamp [offset option]}}
{{$datetime rfc1123|iso8601 [offset option]}}
{{$localDatetime rfc1123|iso8601 [offset option]}}
{{$processEnv [%]envVarName}}
{{$dotenv [%]variableName}}
{{$aadToken [new] [public|cn|de|us|ppe] [<domain|tenantId>] [aud:<domain|tenantId>]}}
3.1 文件中自定义变量
通过@命令来定义变量，然后通过两个大括号{{}}来引用变量：

###
@pkslowHost = www.pkslow.com

GET {{pkslowHost}} HTTP/1.1

