---
title:       "Effective C++(第三版)阅读笔记(一)"
subtitle:    "改善程序与设计的55个具体做法(Rule01-17)"
description: ""
date:        2021-12-12
author:      "liwenyao"
image:       "img/effective-C++.webp"
tags:        ["C++", "程序设计"]
categories:  ["C++"]
---

## 0.序言
这本C++的经典之作，作者是大佬`Scott Meyers`👉[大佬主页](https://www.aristeia.com/books.html)，还写过其他几本影响深远的C++经典，例如`《Effective STL》`,`《More Effective C++》`,`《Effective Mordern C++》`,`《Overview of the New C++(C++11/14)》`等等。本书笔者看的是中文版，侯捷老师翻译的,以前做的笔记是在自己的纸质笔记本上，现在挪到博客上来吧。

关于Effective C++，全书55个C++条款，许多人都做了笔记类的博客，大家视角不同可能侧重也不同，各花入各眼了。(PS:本文主干目录和原书一致，另外，由于原书在C++11之前写成，所以会根据本人开发经验新增一些个人感悟👉`小声bb`环节)

> (本文为**Effective-C++笔记系列的第一部分**，涉及原书第1~3章，内容范围Rule01~17。为方便书写，**Rule01简写为R01**)。

`废话不多说，直接进入正题。`

## 一.让自己习惯C++
###  R01 视C++为一个语言联邦
###  R02 尽量以`const`,`enum`,`inline`替换`#define`
###  R03 尽可能用const
###  R04 确定对象使用前先初始化
## 二.构造/析构/赋值运算
###  R05 了解C++默认编写并调用哪些函数
编译器可以暗自为Class创建default构造函数，copy构造函数(复制构造)，copy assigment(赋值构造)操作符，以及default析构函数。
###  R06 不想编译器的自动生成的函数,明确拒绝
如果不想编译器自动生成那几个函数，比如不想要复制构造或赋值构造，就明确在代码中禁止，也防止外部用户使用。
- 技巧1：可以声明为private函数但是不给出实现，让编译器报错；
- 技巧2：可以设立基类Base，让复制构造和赋值构造都为private函数，让目标类继承于Base类。
###  R07 为多态基类声明`virtual`析构函数

###  R08 别让异常逃离析构函数
###  R09 绝不在构造和析构过程中调用`virtual`函数
###  R10 令`operator=`返回一个reference to *this
###  R11 在`operator=`中处理"自我赋值"
###  R12 复制对象时别忘记其每一个成分
## 三.资源管理
###  R13 以对象管理资源
###  R14 在资源管理类中小心coping行为
###  R15 在资源管理类提供对原始资源的访问
###  R16 成对使用new/delete时要采取相同形式
###  R17 以独立语句将newed对象置于只能指针
