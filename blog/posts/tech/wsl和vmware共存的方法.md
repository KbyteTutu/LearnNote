![image-20220813234308885](https://tutu.gold//posts/tech/wsl和vmware共存的方法.assets/image-20220813234308885.png)

效果如图，开启方法非常简单。但是这个秉承了微软的一贯风格，就是能做到，但是我不默认开启，也不跟你说~

方法如图

![image-20220813234434335](https://tutu.gold//posts/tech/wsl和vmware共存的方法.assets/image-20220813234434335.png)

就是把启用或关闭windows功能中的 虚拟机平台给打开就好了。

个人猜测，是在hyperv托管整个windows的wmi之余，针对常见的虚拟机请求单独做了逻辑，直接当做主机操作系统运行了。

![preview](https://tutu.gold//posts/tech/wsl和vmware共存的方法.assets/v2-f92a9840cbe0eea58d208d3db543988b_r.jpg)

这就让我想到之前玩kvm踩的多层虚拟化的坑了。。果然这种高度面向客户的软件，在里面做的工作很多，让我们能避开很多坑，但是相对的可以调整的点也少了很多啊。有空一定要研究一下hyperv咋搞自定义设置