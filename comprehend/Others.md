# 开发随记

-   POST 和 GET在做类似需求的时候只用一种，避免混淆

## VSCode

ctrl+p 快速开文件

ctrl+g 快速到某行

ctrl+` 开终端

shift+ alt+ f 格式化代码

## py2.7 virtualvenv

cd D:\py27\Scripts

activate

有一个用 C 实现的，更快的，同时兼容 Python2 和 Python3 的第三方模块 fastcache 能够实现同样的功能。实现lru,提升执行效率

## ptvsd

```
import ptvsd
ptvsd.enable_attach(address =('10.95.32.19',7777))
ptvsd.wait_for_attach()
```
调试器，需要配置vscode的json文件

## bat切换当前路径

cd /d %~dp0命令是切换运行目录到脚本所在的目录。
参数解释1：关于“/d”参数
关于cd的/d参数，在cmd中敲入cd /? ，可以看到/d参数的解释如下：
使用 /D命令行开关，除了改变驱动器的当前目录之外，还可改变当前驱动器。
参数解释2：关于“ %~dp0 ”的批处理命令的详细解释
%~dp0 “d”为Drive的缩写，即为驱动器，磁盘、“p”为Path缩写，即为路径，目录。
选项语法:
~0 - 删除任何引号(")，扩充%0，
%~d0 - 仅将%0扩充到一个驱动器号，
%~p0 - 仅将%0扩充到一个路径。

## 报错client_global_hostkeys_private_confirm: server gave bad signature for RSA key 0

.ssh/config里面设置

Host gitlab.com
UpdateHostKeys no
