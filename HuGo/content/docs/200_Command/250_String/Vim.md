---
title: vim
weight: 10
---




## Normal Mode

- 开始编辑
  - `i` 光标前
  - `a` 光标后
  - `I` 行前
  - `A` 行后
  - `o` 下一行
  - `O` 上一行

- 跳跃
  - `^` 行首
  - `$` 行尾
  - 指定行 `<行号>gg`
  - 文首 `gg`
  - 文尾 `GG`
- 编辑
  - `u` 撤销 
  - `Ctrl + r` 取消撤销 
  - 删除单个字符 `x`
  - 剪切当前行 `dd`
  - 复制当前行 `yy`
  - 粘贴行 `p`




## Command Mode

- 设置行号 `:set nu`
- 打开高亮 `:set hls `
- 关闭高亮 `:set nohls`
- 查找 `:/<string>` 
    -   向下查找 `n`
    -   向上查找 `N`
- 替换 `%s/<old_str>/<new_str>/g`
- 
- 窗口
    - `:split` 水平分割窗口
    - `:vsplit` 垂直分割窗口
    - `:close` 关闭创库
    - `Ctrl + w` 切换窗口



## 案例



### 命令帮助

```bash
:help :w
```



### 执行外部命令

```bash
:! ls -al
```



### 插入外部命令的执行结果

```bash
:r ! ls -al
```



### 保存 root 权限的文件

```bash
:w ! sudo tee %

# :w 写入文件
# ! 执行外部命令
# sudo 切换到 root 执行
# tee 将标准输入中的内容写入文件，并传递到后续管道，这里没有后续管道，所以直接丢弃
# % 为当前文件名
```

