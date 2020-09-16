---
title: apt 
weight: 40
---



# APT (Advanced Packaging Tool)



- `apt` = `apt-get` 、 `apt-cache` 、 `apt-config` 最常用命令选项的集合
- `aptitude` 是一个带 UI 的管理工具，也可以非 UI 方式运行



## 常用命令

```bash
# 查看帮助
$ sudo apt help

# 查找软件包
$ sudo apt list | grep <package>
# 查找已安装的包
$ sudo apt list <package>

# 安装
$ sudo apt install <package>
$ sudo apt reinstall <package>

# 卸载
$ sudo apt remove <package>
# 删除未使用到的包
$ sudo apt autoremove

# 查看包信息
$ sudo apt show -a <package>

# 查看日志
$ tail -fn 200 /var/log/apt/history.log
```



## 更新

```bash
# 更新源
$ sudo apt update

# 查看可用的更新
$ sudo apt list --upgradable

# 升级所有可升级的软件包
$ sudo apt upgrade

# ❤ 在升级软件包时自动处理依赖关系
$ sudo apt full-upgrade
```



## 相关文件

```bash
# 软件源的地址
$ /etc/apt/sources.list

# 已经下载到的软件包都放在这里
$ /var/cache/apt/archives
```

> Ubuntu 镜像使用帮助 [http://mirrors.163.com/.help/ubuntu.html](http://mirrors.163.com/.help/ubuntu.html)
