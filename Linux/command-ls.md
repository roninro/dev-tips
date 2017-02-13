---
title: Linux命令(四):ls
date: 2017-01-04 10:05:02
categories: 
- Linux
tags:
- Linux
---

`ls`命令是Linux下查看文件的指令。

## 命令格式

```
ls [选项] [目录名]
```

使用`ls --help` 列出所有关于`ls`的信息。
<!-- more -->

```
[root@localhost ~]# ls --help
用法：ls [选项]... [文件]...
列出 FILE 的信息(默认为当前目录)。
如果不指定-cftuvSUX 或--sort 选项，则根据字母大小排序。

长选项必须使用的参数对于短选项时也是必需使用的。
  -a, --all			不隐藏任何以. 开始的项目
  -A, --almost-all		列出除. 及.. 以外的任何项目
      --author			与-l 同时使用时列出每个文件的作者
  -b, --escape			以八进制溢出序列表示不可打印的字符
      --block-size=大小		块以指定大小的字节为单位
  -B, --ignore-backups		不列出任何以"~"字符结束的项目
  -c				配合-lt：根据ctime 排序并显示ctime(文件
				状态最后更改的时间)
				配合-l：显示ctime 但根据名称排序		其他情况：按ctime 排序
  -C				每栏由上至下列出项目
      --color[=WHEN]		控制是否使用色彩分辨文件。WHEN 可以是
				"never"(默认)、"always"或"auto"其中之一
  -d, --directory		当遇到目录时列出目录本身而非目录内的文件
  -D, --dired			产生适合Emacs 的dired 模式使用的结果
  -f				不进行排序，-aU 选项生效，-lst 选项失效
  -F, --classify		加上文件类型的指示符号(*/=@| 其中一个)
      --format=关键字		交错-x，逗号分隔-m，水平-x，长-l，
				单栏-1，详细-l，垂直-C
      --full-time		即-l --time-style=full-iso
  -g				类似-l，但不列出所有者
      --group-directories-first
			在文件前分组目录。此选项可与--sort 一起使用，
			但是一旦使用--sort=none (-U)将禁用分组
  -G, --no-group		以一个长列表的形式，不输出组名
  -h, --human-readable		与-l 一起，以易于阅读的格式输出文件大小
				(例如 1K 234M 2G)
      --si			同上面类似，但是使用1000 为基底而非1024
  -H, --dereference-command-line
				跟随命令行列出的符号链接
      --dereference-command-line-symlink-to-dir
				跟随命令行列出的目录的符号链接
      --hide=PATTERN         	隐藏符合PATTERN 模式的项目
				(-a 或 -A 将覆盖此选项)
      --indicator-style=方式	指定在每个项目名称后加上指示符号方式：
				none (默认)，classify (-F)，file-type (-p)
  -i, --inode			显示每个文件的inode 号
  -I, --ignore=PATTERN		不显示任何符合指定shell PATTERN 的项目
  -k				即--block-size=1K
  -l				使用较长格式列出信息
  -L, --dereference		当显示符号链接的文件信息时，显示符号链接所指示
				的对象而并非符号链接本身的信息
  -m				所有项目以逗号分隔，并填满整行行宽
  -n, --numeric-uid-gid		类似 -l，但列出UID 及GID 号
  -N, --literal			输出未经处理的项目名称 (如不特别处理控制字符)
  -o				类似 -l，但不列出有关组的信息
  -p,  --indicator-style=slash	对目录加上表示符号"/"
  -q, --hide-control-chars	以"?"字符代替无法打印的字符
      --show-control-chars	直接显示无法打印的字符 (这是默认方式，除非调用
				的程序名称是"ls"而且是在终端输出结果)
  -Q, --quote-name		将条目名称括上双引号
      --quoting-style=方式	使用指定的quoting 方式显示条目的名称：
				literal、locale、shell、shell-always、c、escape
  -r, --reverse			排序时保留顺序
  -R, --recursive		递归显示子目录
  -s, --size			以块数形式显示每个文件分配的尺寸
  -S				根据文件大小排序
      --sort=WORD		以下是可选用的WORD 和它们代表的相应选项：
				extension -X       status   -c
				none      -U       time     -t
				size      -S       atime    -u
				time      -t       access   -u
				version   -v       use      -u
      --time=WORD		和-l 同时使用时显示WORD 所代表的时间而非修改时
				间：atime、access、use、ctime 或status；加上
				--sort=time 选项时会以指定时间作为排序关键字
      --time-style=STYLE	和-l 同时使用时根据STYLE 代表的格式显示时间：
				full-iso、iso、locale、posix-iso、+FORMAT。
				FORMAT 即是"date"所用的时间格式；如果FORMAT
				是FORMAT1<换行>FORMAT2，FORMAT1 适用于较旧
				的文件而FORMAT2 适用于较新的文件；如果STYLE
				以"posix-"开头，则STYLE 仅在POSIX 语系之外
				生效。
  -t				根据修改时间排序
  -T, --tabsize=宽度	指定制表符(Tab)的宽度，而非8 个字符
  -t			按修改时间排序
  -T, --tabsize=COLS	指定制表符(Tab)的宽度，而非8个字符
  -u			同-lt 一起使用：按照访问时间排序并显示
			同-l一起使用：显示访问时间并按文件名排序
			其他：按照访问时间排序
  -U			不进行排序；按照目录顺序列出项目
  -v			在文本中进行数字(版本)的自然排序
  -w, --width=COLS           assume screen width instead of current value
  -x                         list entries by lines instead of by columns
  -X                         sort alphabetically by entry extension
  -1                         list one file per line

SELinux options:

  --lcontext                 Display security context.   Enable -l. Lines
                             will probably be too wide for most displays.
  -Z, --context              Display security context so it fits on most
                             displays.  Displays only mode, user, group,
                             security context and file name.
  --scontext                 Display only security context and file name.
      --help		显示此帮助信息并退出
      --version		显示版本信息并退出

SIZE 可以是一个可选的整数，后面跟着以下单位中的一个：
KB 1000，K 1024，MB 1000*1000，M 1024*1024，还有 G、T、P、E、Z、Y。

使用色彩来区分文件类型的功能已被禁用，默认设置和 --color=never 同时禁用了它。
使用 --color=auto 选项，ls 只在标准输出被连至终端时才生成颜色代码。
LS_COLORS 环境变量可改变此设置，可使用 dircolors 命令来设置。


退出状态：
 0  正常
 1  一般问题 (例如：无法访问子文件夹)
 2  严重问题 (例如：无法使用命令行参数)

```

## 常用示例

### l、L和r、R

+ -r, --reverse			排序时保留顺序
```
$ ls -r
other		iOS		git		cocoapods	README.md
```

+ -R, --recursive		递归显示子目录
```
$  ls -R
README.md	cocoapods	git		iOS		other

./cocoapods:
cocoapods问题记录.mdown
...
```

+ -l					使用较长格式列出信息
+ -L, --dereference		当显示符号链接的文件信息时，显示符号链接所指示

### 只列出文件夹下的子目录

```
ls -F /opt/soft |grep /$ 
ls -F |grep /$   //当前目录

```

### 列出目前工作目录下所有名称是g 开头的档案，愈新的排愈后面

```
ls -ltr g*
```

### 列出目前工作目录下所有档案及目录;目录于名称后加"/", 可执行档于名称后加"*"

```
$ ls -AF

.DS_Store	.gitignore	cocoapods/	iOS/
.git/		README.md	git/		other/

```
### 计算当前目录下的文件数和目录数

```
ls -l * |grep "^-"|wc -l ---文件个数  
ls -l * |grep "^d"|wc -l    ---目录个数
```

### 在ls中列出文件的绝对路径
```
ls | sed "s:^:`pwd`/:"
```

### 列出当前目录下的所有文件（包括隐藏文件）的绝对路径， 对目录不做递归
```
find $PWD -maxdepth 1 | xargs ls -ld
```
### 递归列出当前目录下的所有文件（包括隐藏文件）的绝对路径

```
find $PWD | xargs ls -ld
```
## 关于文件详细信息

[root@localhost ~]# ls -al
总用量 6732
dr-xr-x---  4 root root    4096 10月 31 21:18 .
drwxr-xr-x 23 root root    4096 10月 11 02:18 ..
-rw-------  1 root root    1264 11月  3 00:53 .bash_history
-rw-r--r--  1 root root      18  5月 20 2009 .bash_logout
-rw-r--r--  1 root root     176  5月 20 2009 .bash_profile
-rw-r--r--  1 root root     176  9月 22 2004 .bashrc
-rw-r--r--  1 root root     100  9月 22 2004 .cshrc
-rw-r--r--  1 root root    1106 10月 11 04:40 l2tp.log
-rwxr-xr-x  1 root root   27675 10月 11 04:34 l2tp.sh
drwxr-xr-x  2 root root    4096 10月 11 04:51 my_key
-rwxr-xr-x  1 root root   14451 10月 11 04:40 one-key-ikev2.sh
-rw-------  1 root root    1024 10月 11 04:54 .rnd
-rw-r--r--  1 root root  111838 10月 11 04:14 shadowsocks-libev.log
-rw-r--r--  1 root root   47807 10月 31 21:14 shadowsocks.log
-rwxr-xr-x  1 root root   12679 10月 31 21:11 shadowsocks.sh
drwxrwxr-x  9 1000 1000    4096 10月 11 04:48 strongswan-5.3.5
-rw-r--r--  1 root root 6617824 11月 26 2015 strongswan-5.3.5.tar.gz
-rw-r--r--  1 root root     129 12月  3 2004 .tcshrc
[    1   ] [2] [3] [4]     [5]  [    6     ] [7]  
```

- [1] ：权限
	+ [ d ]则是目录
	+ [ - ]则是文件
	+ [ l ]则表示为连结档(link file)；
	+ [ b ]则表示为装置文件里面的可供储存的接口设备(可随机存取装置)；
	+ [ c ]则表示为装置文件里面的串行端口设备，例如键盘、鼠标(一次性读取装置)。
- [2] ：连结
	>每个文件都会将他的权限与属性记录到文件系统的i-node中，不过，我们使用的目录树却是使用文件名来记录， 因此每个档名就会连结到一个i-node啰！这个属性记录的，就是有多少不同的档名连结到相同的一个i-node号码去就是了。 
	关于[i-node](http://cn.linux.vbird.org/linux_basic/0230filesystem.php#harddisk-inode).
- [3] ：拥有者
- [4] ：群组
- [5] ：文件容量
- [6] ：修改日期
- [7] ：档案名

### 例题：

若有一个文件的类型与权限数据为『-rwxr-xr--』，请说明其意义为何？
答：
先将整个类型与权限数据分开查阅，并将十个字符整理成为如下所示：
```
[-][rwx][r-x][r--]
 1  234  567  890
```
1 为：代表这个文件名为目录或文件，本例中为文件(-)；
234为：拥有者的权限，本例中为可读、可写、可执行(rwx)；
567为：同群组用户权力，本例中为可读可执行(rx)；
890为：其他用户权力，本例中为可读(r)

同时注意到，rwx所在的位置是不会改变的，有该权限就会显示字符，没有该权限就变成减号(-)就是了。
