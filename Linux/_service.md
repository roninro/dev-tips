---
title: Linux命令(一):service
date: 2016-12-30 09:46:22
categories:
- Linux
tags:
- Linux
---



> 原文[《service》-“linux命令五分钟系列”之二](http://roclinux.cn/?p=47)

`service` 顾名思义，就是管理Linux操作系统服务的命令。

**声名：这个命令不是在所有的linux 发行版本都有。主要是在redhat、Fedora、mandiriva、和centos中**

此命令在`/sbin` 目录下，用 `file`命令查看此命令会发现它是一个脚本命令。
> `file` 用来识别文件类型，也可以用来分辨一些文件的编码格式。 它是通过查看文件的头部信息来获取文件类型。

它的作用是去`/etc/init.d`目录下寻找响应的服务，进行开启和关闭等操作。

例如：
<!-- more -->
- 开启`httpd`服务: 
```
service httpd start
service httpd restart
service httpd stop
```

- 关闭`mysql`服务

```
/etc/init.d/mysql stop

service mysql stop
```
