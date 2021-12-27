---
title:       "10个容易遗忘但好用的Linux命令"
subtitle:    ""
description: "Linux命令,博客"
date:        2021-12-18
author:      "liwenyao"
image:       "img/tools.jpeg"
tags:        ["shell脚本", "linux"]
categories:  ["工具" ]
---



### 1)   pgrep

​	pgrep名字前有个p，我们可以猜到这是进程相关的grep命令。不过，这个命令主要是用来列举进程ID的。

```shell
$ pgrep -u  username_xx
```

​	这个命令相当于：

```shell
##效果待定,awk命令不熟悉(逃
ps -ef | egrep '^username_xx' | awk '{print $2}'   
```

### 2）pstree

​	这个命令可以用树形的方式列出进程。

### 3）bc

​	这个命令主要是做一个精度比较高的数学运算的。比如开平方根等。下面是一个我们利用bc命令写的一个脚本（文件名：square.sh）

```shell
#!/bin/bash
if [ $# == 0 ]
then    echo 'Usage: sqrt number'    
	exit 1
else    
	echo -e "sqrt($1)\nquit\n" | bc -q -i
fi
#运行方式：./squar.sh   或者 ./square.sh  10.00
```

### 4）split

​	把一个很大的文件分割成一些小的文件，注意，split执行后源文件仍然在的。

```shell
#例如把上文的square.sh分割成多个文件,先查看大小，发现是124字节
ls -al 
#sqx_为前缀，会得到3个文件:sqx_aa,sqx_ab,sqx_ac
split  -b   50  square.sh   sqx_  
#把文件重新合并，使用cat命令即可
cat  sqx_*  > square.sh.new
```

### 5）nl

​	nl命令其它和cat命令很像，只不过它会打上行号。

```shell
#不加后续的head命令也可以
liwenyao@ubuntu:~$ nl square.sh | head -n 5
     1	#!/bin/bash
     2	if [ $# == 0 ]
     3	then    echo 'Usage: sqrt number'    
     4		exit 1
     5	else 
```

### 6）mkfifo

​	mkfifo的作用是创建一个有名管道，平时使用的较多的是无名管道，例如“ls | grep txt”.

​	有名管道创建后可以像文件一样存在文件夹中，像是一个缓存区。

​	使用举例如下：

```shell
#在终端窗口1执行如下命令，ls没有输出内容
mkfifo  pipex
ls  >  pipex

#打开终端窗口2执行如下命，会看到 ls 命令输出的内容
cat  <   pipex 
```

**拓展：常用的管道命令有**==>

- cut、grep、sort、wc、uniq
- tee：重定向，既能在屏幕输出，又能保存到文件中
- tr、col、join、paste、expand、split

### 7）ldd

​	这个命令可以知道你的一个可执行文件所使用了动态链接库
```shell
###假设有个文件calc.so,命令后接文件名即可，具体参数选项可参照命令help内容
ldd calc.so
```

### 8）col

​	Linux col命令用于过滤控制字符。

​	在许多UNIX说明文件里，都有RLF控制字符。当我们运用shell特殊字符">"和">>"，把说明文件的内容输出成纯文本文件时，控制字符会变成乱码，col指令则能有效滤除这些控制字符。

​	下面以 man 命令帮助文档为例，讲解col 命令的使用。

​	将man 命令的帮助文档保存为man_help，使用-b 参数过滤所有控制字符。在终端中使用如下命令：

```shell
#man命令用法，man + linux命令
man man | col -b > man_help 
```

### 9）xmlwf

​	这个命令可以让你检查一下一个XML文档是否是所有的tag都是正常的。

### 10）lsof

​	这个命令可以列出打开了的文件。

```shell
[root@RHELSVR5 ~]# lsof | grep TCP
httpd       548    apache    4u     IPv6   14300967    TCP *:http (LISTEN)
httpd       548    apache    6u     IPv6   14300972    TCP *:https (LISTEN)
httpd       561    apache    4u     IPv6   14300967    TCP *:http (LISTEN)
httpd       561    apache    6u     IPv6   14300972    TCP *:https (LISTEN)
```