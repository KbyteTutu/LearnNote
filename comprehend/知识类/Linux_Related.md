

# Linux笔记

## Linux操作相关

### 指令详解

- [大全](https://www.runoob.com/linux/linux-command-manual.html)
- 管道标记"|":
在Linux系统中管道线是由竖杠（|）隔开的若干个命令组成的序列，在管道线中，每个命令运行时都有一个独立的进程。前一个命令的输出正是下一个命令的输入。而管道线中有一类命令也称作“过滤器”，过滤器首先读取输入，然后将输入以某种简单方式进行变换（相当于过滤），再将处理结果输出，例如grep、tail、sort和wc等命令就称为过滤器。
举例：

*ls | grep m?.C| wc –l*
打印出当前目录文件名是以m打头、后随一个字符的所有C文件的数目。

- sudo su：
临时获得管理员权限，输入本账号密码。
- tail -f :

  读取指定文件，并实时更新
- 用cd 时， “/”是根目录，"~"是家目录，默认是home

- 软连接 ln [选项] 源文件 目标文件
      -s 就是软连接

- ps -a | grep

- top 查看系统状态

- free 查看内存状态
- ps 查看进程状态
- kill -9
- killall 杀死一类进程
- Ctrl+u删除一行命令

### SSH状态

centos7操作SSH/SSHD服务(查看/启动/重启/自启)
systemctl status sshd.service
systemctl start sshd.service
systemctl restart sshd.service
systemctl enable sshd.service

### rpm

[详解](https://rpm-software-management.github.io/rpm/man/rpm.8.html)
-ivh i是安装install，v是显示过程verbose，h是显示进度hash

<br/>

### 权限
  文件夹的执行权限是表示文件路径有没有检索权。如果文件夹没有读取但是有执行，可以做到直接定位绝对路径执行文件，但是不可以ls指定路径。如果文件夹没有执行权限，则根本无法访问文件夹，无法ls。保证文件安全的方法是设定单个文件的权限。



## Crontab
用 这个可以方便的进行周期性任务调度，定时提交某任务


## Rz/Sz 或者 trz/tsz

rz是上传，trz是下载。我感觉应该比sftp好使


## 用户提权
我这里的普通用户是zhangfei

首先还是需要知道root的密码

第一步：切换到root下：su，并输入密码
第二步：输入  vi /etc/sudoers，加入一行即可（zhangfei   ALL=(ALL)    ALL）
找到  root   ALL=(ALL)   ALL

加入一行即可：

将该普通用户加入权限：

zhangfei   ALL=(ALL)    ALL

## 双向同步工具

https://blog.csdn.net/qq_41961459/article/details/104658868

sudo apt install -y inotify-tools unison

```
#/bin/bash

# $1: from
# $2: to
unison -batch $1 $2
inotifywait -mrq -e create,delete,modify,move $1 | while read line; do
        unison -batch $1 $2
done
```

```
yum install ocaml ocaml-camlp4-devel ctags ctags-etags

cd ~
wget http://www.seas.upenn.edu/~bcpierce/unison//download/releases/stable/unison-2.48.4.tar.gz
tar xvfz unison-2.48.4.tar.gz
cd src
make

sudo cp -v unison /usr/local/sbin/
sudo cp -v unison /usr/bin/

cd ~
rm -fr src
```



## screen命令设置xterm模式

![img](../resources/Linux_Related/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L21laXpodXh1bjczNDA=,size_16,color_FFFFFF,t_70.png)



## 批量kill命令

ps -ef | grep log_a | grep -v grep | awk '{print $2}' | xargs kill -9



# 

