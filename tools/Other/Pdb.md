

# PDB/ Remote pdb 使用方法

这玩意真好使……
pip install remote-pdb


from remote_pdb import RemotePdb;RemotePdb('127.0.0.1', 4444).set_trace()


## [参考](https://www.jianshu.com/p/8e5fb5fe0931)

args	a	打印当前函数的参数
break	b	设置断点
clear	cl	清除断点
condition	无	设置条件断点
continue	c或者cont	继续运行，知道遇到断点或者脚本结束
disable	无	禁用断点
enable	无	启用断点
help	h	查看pdb帮助
ignore	无	忽略断点
jump	j	跳转到指定行数运行
list	l	列出脚本清单
next	n	执行下条语句，遇到函数不进入其内部
p	p	打印变量值，也可以用print
quit	q	退出 pdb
return	r	一直运行到函数返回
tbreak	无	设置临时断点，断点只中断一次
step	s	执行下一条语句，遇到函数进入其内部
where	w	查看所在的位置
!	无	在pdb中执行语句