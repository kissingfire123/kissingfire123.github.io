---
title: "常用Git命令行总结"
date: 2022-01-02T10:50:54+08:00
draft: false
featuredImage:       "/img/Script-Pic/linux-commandLine.webp"
categories:  ["脚本"]
---

# 前言
# 添加与撤回


# 拉取
# 提交
# 查看diff与Log
# 推送
# 变基
# 子模块
# 删除一个子模块
子模块的删除并非像添加时那么简单轻松，注意按下述顺序操作：
-  回退.gitmodules文件的修改,`git restore`回退之后`git add`暂存；
-  删除目录树和索引文件，执行: `git rm --cached path_to_submodule`,(path_to_submodule替换成实际路径);
-  删除.git目录的文件记录，执行：`rm -rf .git/modules/path_to_submodule`;
-  删除本地文件：`rm -rf path_to_submodule`，最后`git commit`上述修改即可完全删除子模块 。

