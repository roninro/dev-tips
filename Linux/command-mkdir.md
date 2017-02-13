---
title: Linux命令(五):mkdir
date: 2017-01-04 10:10:30
categories: 
- Linux
tags:
- Linux
---

`mkdir` 用来创建指定名称的目录，要求创建目录的用户在当前目录中具有写权限，并且指定的目录名不能是当前目录中已有的目录。

## 命令格式

```
mkdir [选项] [目录名]
```
选项：

```
-m  -mode  //设定权限
-p  -parents 	//可以是一个路径名称。此时若路径中的某些目录尚不存在,加上此选项后,系统将自动建立好那些尚不存在的目录,即一次可以建立多个目录

```

## 常用示例

### 创建一个空目录
```
mkdir test1
```
<!-- more -->
### 递归创建多个目录
```
mkdir -p test2/test22
```

### 创建权限为777的目录
```
mkdir -m 777 test3
```

### 创建新目录并显示信息
```
mkdir -v test4

mkdir -vp test5/test51
```

### 一个命令创建项目的目录结构
```
mkdir -vp scf/{lib/,bin/,doc/{info,product},logs/{info,product},service/deploy/{info,product}}
```
```
tree scf/
scf/
├── bin
├── doc
│   ├── info
│   └── product
├── lib
├── logs
│   ├── info
│   └── product
└── service
    └── deploy
        ├── info
        └── product

12 directories, 0 files

```