# 利用Hugo和Github-Pages搭建免费的个人博客



# 0.为什么选Hugo+Github-Page
说起博客，除了用个人vps+wordPress这种麻烦但diy程度高的方式，比较流行的应该就是CSDN，博客园和简书，以及GithubPage(同类还有GiteePage)。因为可以对自己博客的完全掌控性，以及管理便利性，大多数博主各方面权衡后，选择了GitHubPage搭建静态网页的形式，与之配合的静态博客框架有`jekyll`、`hexo`和`hugo`。

有博主对3种框架进行过简单的测试对比，`编译速度`应该是Hugo>Hexo>Jekyll。

Jekyll由Ruby开发，是Github Page默认原生支持的框架，本人了解不多。

Hexo由Node.js开发，应该是使用人数最多的，主题齐全美观，功能稳定，部署和配置比Hugo稍微麻烦些。

而Hugo，由GO语言开发，号称是最快的静态网站部署框架(200篇博文编译大概1秒)，现在也有不少人从Hexo迁移到Hugo，所以还是选Hugo吧。

**简述过程**：

`Github Page`，可以用来免费部署静态网站，使用效果也很直接，创建一个代码仓库，然后将上述的静态网站框架包含的文件拖进去，选择主题配置好，然后本地编译后得到静态网页内容，一起Push到远端仓库，Github Page会帮你部署好网站，假设**usernamexxx**是你的Github账号，那么进入域名https://usernamexxx.github.io 就可以打开你的博客了(当然这个域名可以后续自己折腾换成其他，这是后话了)。
# 1.准备工作
* 拥有一个Github账号，参考[腾讯云：一步一步教你注册GitHub账号及简单使用.](https://cloud.tencent.com/developer/article/1487508)
  (邮箱建议不要用qq邮箱，虽然用了后面也有办法换，但在后续CDN加速的时候qq邮箱可能有问题)
* 电脑安装Git，下载安装地址：[安装 Git.](https://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-%E5%AE%89%E8%A3%85-Git)
* 电脑安装Hugo
  
  `最简单的办法`，就是直接下载二进制免安装包，安装包下载地址[Hugo-Release](https://github.com/gohugoio/hugo/releases),选择最新的安装包，解压到本地某目录，并添加一下环境变量`PATH`即可。
  
  `如果坚持用命令行`:
  如果是mac系统，相信你已经有了`brew`程序，直接执行`brew  install  hugo`即可完成安装。

  如果是Windows系统想要命令行安装，则**管理员身份证运行**终端，执行:

  ```powershell
  # 如果有chocolatey，就直接执行
  choco install hugo -confirm
  # 如果没有chocolatey，就先安装一下
  powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
  # 设置环境变量
  SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
  ```
  安装成功后，命令行执行 **`hugo version`** 检查hugo版本，能正确打印版本信息即表示正常安装。
# 2.开通Github-Page
不太熟悉Github的朋友，官方写了很好的Quick Start，图文并茂的，直接贴链接吧，[Github Page:Websites for you and your projects.](https://pages.github.com/)

熟悉Github的朋友，直接新建一个public的仓库，如果用户名为**usernamexxx**仓库名为`usernamexxx.github.io`。
成功之后，请立即克隆到本地，并测试第一个网页，比克隆到D盘路径"`/d/Files`",执行如下命令： 
```shell
#假设用户名是usernamexxx
cd /d/Files
git clone https://github.com/usernamexxx/usernamexxx.github.io.git  
cd usernamexxx.github.io
#测试第一个网页
echo "Hello World" > index.html
git add --all
git commit -m "Initial commit"
git push -u origin main
```
> 注意⚠
> 上述Git-Push时可能会遇到填写账号密码的问题，密码注意是需要填写`Access Token`，可以直接访问[Github-Developer-Setting](https://https://github.com/settings/tokens),生成一个token，当作本次密码填入(Github从2021年8月份开始就需要这样通过https推代码了))。

Git简单设置避免后续麻烦：
```shell
#windows平台需要执行这个，避免行尾\r\n,CRLF的提示，挺烦的
git config --global core.autocrlf false
#终端环境保存https的token密码，避免每次都输入密码
git config --global credential.helper store
```

虽然这个免费的服务有一些限制：项目大小最大为1GB，每月带宽使用不超过100GB，每小时最多构建10个版本。对于个人博客网站，是绰绰有余了，所以不用担心。
# 3.新建hugo site站点
对于Windows系统，以下命令行都建议在**Git-Bash**中运行。
如上一节所述，我们的仓库在路径"`/d/Files/usernamexxx.github.io`".
```shell
#cd到git仓库的目录
cd /d/Files/usernamexxx.github.io
#确认关联到了远端仓库https://github.com/usernamexxx/usernamexxx.github.io.git
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

#cd到站点目录的原因：所有hugo命令都要在hugo根目录下执行
cd MyHugoBlog
```

# 4.设置主题
Hugo支持非常多简洁又美观的主题，可以在[Hugo中文站的主题列表](https://www.gohugo.org/theme/)里或者[Hugo官方站的主题列表](https://themes.gohugo.io/)挑选，看个人喜好了。这里可以不用太纠结，可以先随便选一个，让站点运行起来先，可以很方便就换掉的(配置文件里的`theme`选项)。

举例，看中了[`Even`主题](https://themes.gohugo.io/themes/hugo-theme-even/),Github地址为：https://github.com/olOwOlo/hugo-theme-even ，不要直接下载或直接clone，考虑到后续可能想有自定义修改，去Github界面fork到你自己仓库，然后再添加为子模块：

```shell
cd /d/Files/usernamexxx.github.io
git submodule add https://github.com/usernamexxx/hugo-theme-even  MyHugoBlog/theme/even
```

# 5.创建hugo新文章
hugo的新文章在content/post目录，或者content/posts目录，看个人习惯而定，试用了几个主题，不同主题默认位置可能是二者其一。例如，执行下述hugo命令：
```shell
cd /d/Files/usernamexxx.github.io/MyHugoBlog
#会新建文件content/post/MyFirst.md
hugo new post/MyFirst.md
```
新生成的markdown文档默认如下(`三个短横---`之间是配置选项，正文内容从短横之后开始)，可以手动添加一下正文内容 ：
```markdown
---
title: "First"
date: 2022-01-03T15:19:14+08:00
draft: true
---
# 正文内容在这里
- Hello world,first post!
```
其中draft的含义是草稿的意思，在正式发布的时候不会被包含和编译，那时要改为false。

所有文章的通用设置在根目录的`config.toml`进行配置，需要关注的有如下选项，更多选项请参考[hugo-configuration](https://www.gohugo.org/doc/overview/configuration/)
```toml
baseURL = 'https://usernamexxx.github.io'
languageCode = 'zh-cn'
title = "my blog"
theme = "even" 
publishDir="../docs"   
```
上述`publishDir`也可以不配置，默认是根目录下的`public`目录，意思是后续编译出的静态网页文件存放的目录，不和hugo的内容文件混在一起的话，方便后续查看Git-Log以及其他部署工作。

至此，Hugo新站点的骨架都搭建完了，可以`本地调试`看看效果了，在命令行运行：
```bash
cd  /d/Files/usernamexxx.github.io/MyHugoBlog
hugo server -w
```
终端提示"*Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)*"，访问localHost本地URL： http://localhost:1313 ，即可看到上述添加的MyFirst.md里的内容，并且保持终端site运行的情况下，手动修改markdown内容，保存一下，**网页实时更新**，`调试非常方便`也非常快。

将draft设置为true，并编译后推送至远端，即可访问https://usernamexxx.github.io看到网页内容了。执行如下：
```bash
cd  /d/Files/usernamexxx.github.io
git add .
git commit -m "first content post"
cd MyHugoBlog
hugo 
#假设这里配置的publishDir="../docs"，如果不配置就是public目录
git add ../docs
git commit -m "compiled results"
git push -u origin
```
**至此，就完成了Hugo + Github Page**的搭建工作，不难发现，现在的站点有一点简陋(主题对应的特定选项还没配)，继续往下看，就是美化过程。
# 6.配置theme相关的Config
每个主题都有Github仓库，除了ReadMe内容，还可以看看Issue，你遇到的问题可能别人也遇到过，还有就是参考主题的exampleSite，看看图片是怎么设置路径的、SEO优化、评论插件等等内容。
中英文的官方站加起来有300个左右的主题，我尝试了6个主题，推荐3个比较喜欢的吧：
- [LoveIt主题](https://github.com/dillonzq/LoveIt)
- [CleanWhite主题](https://github.com/zhaohuabing/hugo-theme-cleanwhite)
- [Ananke主题](https://github.com/theNewDynamic/gohugo-theme-ananke.git)

# 7.关于加速
众所周知，Github-Page在国内访问大部分时候比较慢，这时加速访问就很有必要了。除了花RMB在腾讯云阿里云买CDN加速服务，也有免费方案。`Vercel`,`Cloudflare`和`Netlify`都是不错的选择，我选了[vercel-site](https://vercel.com/)进行加速(还可以拥有免费的二级域名vercel.app)，网络资料很多，就不赘述了。

关于网站访问速度的评估，有个输入你网址就能分析访问性能的网站，网址为: [PageSpeed](https://pagespeed.web.dev)。可以很方便地看到一些明显的问题，例如图片过大或者过多(推荐用webp格式的图,可以用ffmpeg等工具转换格式)，以及js代码负载过大等问题。


> 遇到问题欢迎留言与沟通，Enjoy~

> 参考链接：

* [静态博客框架jekyll、hexo和hugo三者之间的区别与差异](https://zhuanlan.zhihu.com/p/368407566)
* [Why I switched from Octopress 2 to Hugo](https://conscientiousprogrammer.com/blog/2015/05/31/why-i-switched-from-octopress-2-to-hugo/)
* [浅谈我为什么从 HEXO 迁移到 HUGO](https://sspai.com/post/59904)
* [利用hugo和GitHub Pages搭建一个易用的个人博客](https://thmiao.github.io/posts/first_post/)
* [Hugo中文文档](https://www.gohugo.org/doc/)
