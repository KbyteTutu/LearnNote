# Docker

## 命令

docker run -itd --net=host --name=tip_gwxt -v /data/tip_international:/opt/ --privileged=true tip:international /user/sbin/init

docker commit -a "tukechao" -m "" 748c261a615f  gwxt:2.3.0.104

## 新镜像


docker run -itd -p 4433:443 --name=tip_zygz1 -v /data/tip_zygz/tip_1.0:/opt/tip -v /opt/tipdata0:/opt/tipdata0 --privileged=true ff3aec8fa24e init

## tip
在docker下安装tip 可能会缺少依赖
已尝试下列方式，记录于此
[一个大兄弟的收集](https://huataihuang.gitbooks.io/cloud-atlas/content/virtual/docker/using_docker/docker_run_centos_container.html)
yum install -y python-devel


yum install jansson-devel
yum install ethtool
<!-- yum install net-tools -->
yum install pciutils

yum install cryptsetup
yum install dmidecode
<!-- dmicode包是用来生成系统硬件信息的 -->
<!-- yum install net-tools.x86_64 -->

docker commit -a "tukechao" -m "clean centos7 for tip with essential dependencies" 91ea43549004  centos7_tip_clean:v1.5
**上面这几条最重要**

```
yum clean all
yum update

yum -y install sudo which mlocate net-tools rsyslog file ntp ntpdate \
wget tar bzip2 screen sysstat unzip nfs-utils parted lsof man bind-utils \
gcc gcc-c++ make telnet flex autoconf automake ncurses-devel crontabs \
zlib-devel git openssh-clients openssh-server initscripts jansson-devel \
ethtool python-devel pciutils cryptsetup dmidecode
```

然后是TipTools安装
考虑安装5GB版本


## 容器内获取外边数据
[相关](https://blog.csdn.net/wufolangren/article/details/86702274?spm=1001.2101.3001.6650.5&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-5.pc_relevant_antiscanv2&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-5.pc_relevant_antiscanv2&utm_relevant_index=10)
将/proc目录挂载到容器的/hostinfo/proc目录，然后读取文件来提取信息
如提取cpu使用率，参见:http://www.blogjava.net/fjzag/articles/317773.html
其他信息类似