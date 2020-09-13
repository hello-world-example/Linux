---
title: zsh
weight: 1
---

# zsh

## 切换 zsh

```bash
$ chsh -s /bin/zsh

# 查看 zsh 版本
$ /bin/zsh --version
zsh 5.3 (x86_64-apple-darwin17.0)

# 切换回 bash
$ chsh -s /bin/bash
```



## oh-my-zsh

```bash
# clone 仓库
$ git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# 拷贝一份 zsh 模板
$ cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```



## 环境变量

- `.zshrc` : `zsh` 的用户环境变量文件
- `.bash_profile` : `bash` 的用户环境变量文件
- 
- `zsh` 继承  `bash` 的环境变量配置
  -  `cat 'source ~/.bash_profile' >> ~/.zshrc ` 
  -  `cat 'source /etc/profile' >> ~/.zshrc ` 





## 使用 agnoster 主题

> - 主题列表： https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
> - [agnoster / agnoster-zsh-theme 主题](https://github.com/agnoster/agnoster-zsh-theme)

### 修改主题

```bash
# 编辑 zsh 文件，找到 ZSH_THEME，修改为 agnoster
$ vim ~/.zshrc
ZSH_THEME="agnoster"
```

### 乱码问题 - 安装字体

> - https://github.com/powerline/fonts.git 或
> - https://github.com/abertsch/Menlo-for-Powerline.git

```bash
$ git clone https://github.com/abertsch/Menlo-for-Powerline.git

# 双击字体文件进行安装
$ open Menlo-for-Powerline/*.ttf
```

- 重启 `iTerm`
- `⌘ + ,` > `Profiles` > `Text` > `Font` >  选择字体 **`'Menlo for Powerline'`**





## Read More

- www.zsh.org
  - [Z  Shell Doc](http://zsh.sourceforge.net/Doc/Release/zsh_toc.html)
- https://ohmyz.sh/
  - [Oh My Zsh wiki](https://github.com/ohmyzsh/ohmyzsh/wiki)

