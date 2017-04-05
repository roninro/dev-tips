# Linux笔记

@(日常整理)


零星点点，积少成多。

## Mac下通过终端ssh 远程连接CentOS服务器
```bash
ssh -p 28415 p -l  mervin 23.83.222.22
```
ssh 连接的时候
```bash
 Host key verification failed. ssh
 Host key verification failed. 
```
解决方法：
```bash
vi ~/.ssh/known_hosts // delete some info about rsa

or

cd ~/.ssh
rm known_hosts
```

## Linux 文件与目录管理

`pwd`	☞打印当前目录
`./`	☞当前目录
`../`	☞当前目录的上一级目录

`mkdir` ☞创建一个目录，`mkdir [-m p] [目录名称]` 其中 -m, -p是选项

-  -m 是创建目录权限，不常用
-   -p是递归创建目录。

`rmdir` 删除一个目录

- `rmdir `其实是rmove directory 缩写，其只有一个选项`-p` 类似与mkdir命令，这个参数的作用是将上级目录一起删除。举个例子吧，新建目录mkdir -p d1/d2/d3 ，rmdir -p d1/d2/d3相当于是删除了d1,d1/d2, d1/d2/d3。如果一个目录中还有目录，那么当你直接rmdir 该目录时，会提示该目录不为空，不能删除。如果你非要删除不为空的目录，那你用rm指令吧。

`rm`删除目录或文件

`rmdir` 只能删除目录但不能删除文件，要想删除一个文件，则要用rm命令了。
+ `-f`强制的意思，如果不加这个选项的话，当删除一个·`不存在`的文件时会报错。
+ `-i` 作用是当用户删除一个文件是会提示用户是否真的删除。
+ `-r` 当删除目录时，加该选项。不加会报错。`rm`是可以删除`不为空`的目录的。

`which`用来查找一个命令的绝对路径。
```bash
which rm
alisas rm = 'rm -i'
			/bin/rm
```

