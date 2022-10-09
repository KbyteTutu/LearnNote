## 修正-bash-4.2$错误

```bash
cp /etc/skel/.* .
```

然后修改用户和用户组为待修正用户

如果还不行，在.bash_profile里添加这段

```
export PS1='[\u@\h \w]' 
```



