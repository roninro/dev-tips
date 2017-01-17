## 简单的 Python HTTP Server

```
cd  ～/tmp

python -m SimpleHTTPServer

```
在浏览器中输入http://127.0.0.1:8000.

`python -m SimpleHTTPServer port` 默认端口是8000


```
vim ~/.bash_profile
alias pyhttp='python -m SimpleHTTPServer'
source ~/.bash_profile
cd ~/tmp
pyhttp #  重启终端有效（Mac）
```