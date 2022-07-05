@echo off
@title bat 交互执行git命令


cd /d %~dp0
cd ..
git add .
git commit -m "%date:~0,4%年%date:~5,2%月%date:~8,2%日,%time% 同步"
git pull
git push origin main
