一个是os.system("xxx")这样是执行命令，这样是返回状态码

另一个是os.popen("xxx",'r',1) 返回一个file对象，要read()