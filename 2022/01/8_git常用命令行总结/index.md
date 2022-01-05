# 常用Git命令行总结


# 前言
# 添加与撤回
Git有工作区(也就是本地文件)--> 暂存区(staged)  --> 仓库，如下图所示：
![git-add-commit](https://camo.githubusercontent.com/174838ee47136e1be0c8281019169593462ea4c16b47ddea634377bf9762b0a6/68747470733a2f2f7777772e6c69616f78756566656e672e636f6d2f66696c65732f6174746163686d656e74732f3931393032303033373437303532382f30) 



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


