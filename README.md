# [ZJU-General-Physics-Assistance-Project](https://crazyspotteddove.github.io/projects/zju-gpa)

这里是普物 (H) 笔记小组关于 G.P.A 的编写工程。

## 关于工程

在大一下的学习中，深深感受到普物 (H) 课程的资料极度缺乏。所以栽树，为后留荫。

## 关于贡献

笔记由学生编写，难免有出错或者叙述不恰当的时候，欢迎所有同学的纠正。

也欢迎所有同学贡献例题与解答，配图，或者其它有关普物的资料。

本书模板由 CrazySpottedDove(斑鸠) 负责，水平比较有限，欢迎 LaTeX 水平高的同学贡献美工。

- 本地构建：

```sh
# 连续编译 11 次
./build.sh
```

- 贡献配图：

同时贡献 `foo.png` 和 `inversed_foo.png`，以保证暗色版可编译。

- 上传更新：

已配置了 github workflow，只需要打一个 git tag，然后上传到 master 分支，构建发布工作会由 github 资源自动执行。

```sh
# for example
git add .
git commit -m "foo"
git tag v*.*.*
git push origin --tags
```

## 关于构建

* 如果需要稳定版，为documentclass添加可选参数stable
* 如果需要暗色版，为documentclass添加可选参数dark
* 不要删除辅助文件，除非你想连续编译 11 次！
* 如果提示没有 Times New Roman 字体，只需在 Physics_H_Notes.cls 中将以下命令注释掉：

```latex
\setmainfont{Times New Roman}
```

## 关于使用

本项目的许可证为  [![CC BY-NC-SA Logo](https://i.creativecommons.org/l/by-nc-sa/4.0/80x15.png) 知识共享署名-非商业性使用-相同方式共享 4.0 国际许可协议](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh)
