@echo off
@title bat ����ִ��git����


cd /d %~dp0
cd ..
git add .
git commit -m "%date:~0,4%��%date:~5,2%��%date:~8,2%��,%time% ͬ��"
git pull
git push origin main
