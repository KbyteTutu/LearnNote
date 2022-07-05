# Git

## 初始化

```
git config --global user.name "tukechao"
git config --global user.email "tukechao@xxxx.com"
```

## git 提交的流程

```
git add .
git commit -m 暂存之后加提示
git push origin master
```

## git branch相关操作

git branch -a 列出
git branch (name) 创建
git checkout -b (name) 切换
git merge 合并

## git pull 和rebase的理解

​	首先应该先commit再pull再push，第一步保证git知道你要改什么，第二步让git获取最新，最后让git进行合并。这样是合理的逻辑

如果是这样，则是会进行merge，即根据commit的内容合成一个新的提交，这样整个工作流程不会错。

如果是rebase，则会将现有的服务器内的commit等合成一个base（这就是变基的意义）然后提交，这样实际上是会扰乱提交历史的。不过如果没有误操作，这样也是可以保证你的提交是最后一次，并且保证最后结果正确。

如果出现多余的merge 信息
[https://blog.csdn.net/weixin_44202659/article/details/103841807]





