```undefined
ssh-keygen

```

**ssh-keygen** 产生公钥与私钥对.

**ssh-copy-id** 将本机的公钥复制到远程机器的authorized_keys文件中，ssh-copy-id也能让你有到远程机器的home, ~./ssh , 和 ~/.ssh/authorized_keys的权利


第一步:在本地机器上使用ssh-keygen产生公钥私钥对

1.  $ ssh-keygen

    

第二步:用[ssh](https://so.csdn.net/so/search?q=ssh&spm=1001.2101.3001.7020)-copy-id将公钥复制到远程机器中

$ ssh-copy-id -i .ssh/id_rsa.pub 用户名字@192.168.x.xxx

**注意:** ssh-copy-id **将key写到远程机器的 ~/** .ssh/authorized_key.文件中

第三步: 登录到远程机器不用输入密码

1.  $ ssh 用户名字@192.168.x.xxx
2.  
3.  Last login: Sun Nov 16 17:22:33 2008 from 192.168.1.2

常见问题：

1.  ssh-copy-id -u eucalyptus -i ~eucalyptus/.ssh/id_rsa.pub ssh 用户名字@192.168.x.xxx
2.  第一次需要密码登录

上述是给eucalyptus用户赋予无密码登陆的权利

1.  /usr/bin/ssh-copy-id: ERROR: No identities found

使用选项 *-i* ，当没有值传递的时候或者 如果 *~/.ssh/identity.pub* 文件不可访问（不存在）, *ssh-copy-id* 将显示上述的错误信息 （ -i选项会优先使用将ssh-add -L的内容）





# ssh-copy-id  -i ~/.ssh/id_rsa.pub -p 60022 "develop@10.46.177.164"
