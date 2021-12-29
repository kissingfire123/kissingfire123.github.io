---
title:       "利用Hugo和Github-Pages搭建免费的个人博客"
subtitle:    ""
description: "Hugo,Github Pages,个人博客"
date:        2021-12-19
author:      "liwenyao"
image:       "img/tools.webp"
tags:        ["Hugo", "Github Page"]
categories:  ["工具" ]
---


# 0.为什么选Hugo+Github-Page
说起博客，除了用个人vps+wordPress这种麻烦但diy程度高的方式，比较流行的应该就是CSDN，博客园和简书，以及GithubPage(同类还有GiteePage)。因为可以对自己博客的完全掌控性，以及管理便利性，大多数博主各方面权衡后，选择了GitHubPage搭建静态网页的形式，与之配合的静态博客框架有`jekyll`、`hexo`和`hugo`。

有博主对3种框架进行过简单的测试对比，`编译速度`应该是Hugo>Hexo>Jekyll。

Jekyll由Ruby开发，是Github Page默认原生支持的框架，本人了解不多。

Hexo由Node.js开发，应该是使用人数最多的，主题齐全美观，功能稳定，部署和配置比Hugo稍微麻烦些。

而Hugo，由GO语言开发，号称是最快的静态网站部署框架(200篇博文编译大概1秒)，现在也有不少人从Hexo迁移到Hugo，所以还是选Hugo吧。

**简述过程**：

`Github Page`，可以用来免费部署静态网站，使用效果也很直接，创建一个代码仓库，然后将上述的静态网站框架包含的文件拖进去，选择主题配置好，然后本地编译后得到静态网页内容，一起Push到远端仓库，Github Page会帮你部署好网站，假设**username**是你的Github账号，那么进入域名https://username.github.io 就可以打开你的博客了(当然这个域名可以后续自己折腾换成其他，这是后话了)。
# 1.准备工作
- 拥有一个Github账号，参考[腾讯云：一步一步教你注册GitHub账号及简单使用.](https://cloud.tencent.com/developer/article/1487508)
  (邮箱建议不要用qq邮箱，虽然用了后面也有办法换，但在后续CDN加速的时候qq邮箱可能有问题)
- 电脑安装Git，下载安装地址：[安装 Git.](https://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-%E5%AE%89%E8%A3%85-Git)
- 电脑安装Hugo
  
  `最简单的办法`，就是直接下载二进制免安装包，安装包下载地址[Hugo-Release](https://github.com/gohugoio/hugo/releases),选择最新的安装包，解压到本地某目录，并添加一下环境变量`PATH`即可。

  如果是mac系统，也可以选择命令行，相信你已经有了`brew`程序，直接执行`brew  install  hugo`即可完成安装。

  如果是Windows系统想要命令行安装，则**管理员身份证运行**终端，执行:

```powershell
# 如果有chocolatey，就直接执行
choco install hugo -confirm
# 如果没有chocolatey，就先安装一下
powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
# 设置环境变量
SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```
# 2.Github-Page的开通
官方写了很好的Quick Start，图文并茂的，直接贴链接吧，[Github Page:Websites for you and your projects.](https://pages.github.com/)

成功之后，作为**username**的你会得到一个形如`https://github.com/username/username.github.io.git`的新仓库。

虽然这个免费的服务有一些限制：项目大小最大为1GB，每月带宽使用不超过100GB，每小时最多构建10个版本。对于个人博客网站，是绰绰有余了，所以不用担心。
# 3.Hugo site新建与部署
对于Windows系统，以下命令行都建议在**Git-Bash**中运行。
将第2步得到Clone到电脑本地某文件夹，比如在D盘"`/d/Files/username.github.io`".
```shell
#cd到git仓库的目录
cd /d/Files/username.github.io
#确认关联到了远端仓库https://github.com/username/username.github.io.git
git branch -v
# 新建hugo站点,起个英文site名，比如MyHugoBlog
hugo new site MyHugoBlog
##文件夹下会生成如下
#   MyHugoBlog
#     ├─archetypes
#     ├─content   (markdown内容存放处,一般是content/post/hello.md)
#     ├─data
#     ├─layouts
#     ├─static     (站点静态资源存放处,比如image,js,css)
#     ├─themes     
#     └─config.toml  (站点最重要的配置文件)
      

```
# 4.关联Hugo-site与Github-Repo
# 5.配置theme相关的Config


> 参考链接：

* [静态博客框架jekyll、hexo和hugo三者之间的区别与差异](https://zhuanlan.zhihu.com/p/368407566)
* [Why I switched from Octopress 2 to Hugo](https://conscientiousprogrammer.com/blog/2015/05/31/why-i-switched-from-octopress-2-to-hugo/)
* [浅谈我为什么从 HEXO 迁移到 HUGO](https://sspai.com/post/59904)
* [利用hugo和GitHub Pages搭建一个易用的个人博客](https://thmiao.github.io/posts/first_post/)