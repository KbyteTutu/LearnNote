# rsync

## [教程](http://www.ruanyifeng.com/blog/2020/08/rsync.html)



使用rsync一定要注意的一点是**，源路径如果是一个目录的话，带上尾随斜线和不带尾随斜线是不一样的，不带尾随斜线表示的是整个目录包括目录本身，带上尾随斜线表示的是目录中的文件，不包括目录本身。**例如：

```
[root@xuexi ~]# rsync -a /etc /tmp
[root@xuexi ~]# rsync -a /etc/ /tmp
```

第一个命令会在/tmp目录下创建etc目录，而第二个命令不会在/tmp目录下创建etc目录，源路径/etc/中的所有文件都直接放在/tmp目录下。



## 对比文件差异

sudo rsync -rvn -i --delete -c --size-only --exclude={'*.pyc','*.docx','*.log'} a/ b/ | sed -n '2,/^$/{/^$/!p}'

`rsync -rvn --delete directory1/ directory2 | sed -n '2,/^$/{/^$/!p}' deleting a/xyz.avi rsync.txt 新建文件夹/542D0.mp4`其中deleting所在的行就是directory2中多出的文件。其他的都是directory中多出的文件。如果想区分出不同的是目录还是文件。可以加上"-i"选项。`rsync -rvn -i --delete directory1/ directory2 | sed -n '2,/^$/{/^$/!p}' *deleting   a/xyz.avi >f+++++++++ rsync.txt >f+++++++++ 新建文件夹/542D0.mp4`其中`>f+++++++++`中的f代表的是文件，d代表的目录。

- 上面的rsync比较目录有几点要说明：一定不能缺少-n选项，它表示dry run，也就是试着进行rsync同步，但不会真的同步。

- 第一个目录(directory1/)后一定不能缺少斜线，否则表示将directory1整个目录同步到directory2目录下。

- 其它选项，如"-r -v --delete"也都不能缺少，它们的意义想必都知道。

- sed的作用是过滤掉和文件不相关的内容。以上rsync假定了比较的两个目录中只有普通文件和目录，没有软链接、块设备等特殊文件。如果有，请考虑加上对应的选项或者使用-a替代-r，否则结果中将出

    skipping non-regular file的提示。但请注意，如果有软链接，且加了对应选项(-l或-a或其他相关选项)，则可能会出现`fileA-->fileB`的输出。

- 效率很高，因为rsync的原因，筛选的可定制性也非常强。



## 远程复制

sudo rsync -a -e "ssh -p $remote_port" --delete  -og --chown=develop:develop /root/workspace/qradar-app/ develop@$remote_host:/home/develop/qradar/qradar-app

可以用这种方式进行远程复制。其中--og --chown是控制在上传时目标文件的用户组。不设置对会有权限问题
