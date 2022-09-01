# WGSI相关知识

uWSGI是一个Web服务器，它实现了WSGI协议、uwsgi、http等协议。Nginx中HttpUwsgiModule的作用是与uWSGI服务器进行交换。

- 要注意 WSGI / uwsgi / uWSGI 这三个概念的区分。

> WSGI是一种通信协议。uwsgi是一种线路协议而不是通信协议，在此常用于在uWSGI服务器与其他网络服务器的数据通信。而uWSGI是实现了uwsgi和WSGI两种协议的Web服务器。uwsgi协议是一个uWSGI服务器自有的协议，它用于定义传输信息的类型（type of information），每一个uwsgi packet前4byte为传输信息类型描述，它与WSGI相比是两样东西。

## WSGI

> 英文全称：Web Server Gateway Interface，Web服务网管接口，简单来说它是一种Web服务器和应用程序间的通信规范。

## uwsgi

> uwsgi是一种通信协议，不过跟WSGI分属两种东西，该协议下速度比较快。

## uWSGI

> uWSGI是一个Web Server，并且独占uwsgi协议，但是同时支持WSGI协议、HTTP协议等，它的功能是把HTTP协议转化成语言支持的网络协议供python使用。

**一般用的都是这个。** 考虑并发性能等情况，一般不用flask的原生webserver来进行工作。 uwsgi+nginx可以达到很好的性能。

## uwsgi配置文件示例

[详细](https://uwsgi-docs.readthedocs.io/en/latest/Options.html?highlight=ini)  
[uwsgi]  
disable-logging = true  
pidfile = /var/run/tip/flask_web.pid **进程的文件，决定进程pid**  
socket = 127.0.0.1:5001 **通信的端口**  
#socket = /tmp/uwsgi.sock  
#processes = 2  
processes = 4  
#threads = 1  
#cpu_affinity = 1  
thunder-lock = true**如果可能，序列化接收内容**  
listen = 65535  **set the socket listen queue size**
buffer-size = 10240
**Set the max size of a request (request-body excluded), this generally maps to the size of request headers. By default it is 4k. If you receive a bigger request (for example with big cookies or query string) you may need to increase it. It is a security measure too, so adapt to your app needs instead of maxing it out.控制request大小（请求体除外）。可能存在安全风险，所以不应该设置成默认最大**  
lazy-apps = true**load apps in each worker instead of the master**  
enable-threads = false  
master = true**启动master进程**  
chdir = %(pythonpath)**项目目录**  
wsgi-file = rest_main.py  
callable = app**set default WSGI callable name**  
vacuum = true**自动移除unix Socket 和 Pid 文件 当服务停止的时候**  
logto = /var/log/tip/uwsgi/uwsgi_web.log  
plugins = python  
post-buffering=8192**post缓冲大小**  
log-maxsize = 100000000  
#daemonize = true  
