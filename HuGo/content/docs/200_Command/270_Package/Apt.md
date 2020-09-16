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



## sources.list 文件格式

```bash
# 当前系统版本
$ lsb_release -a
Distributor ID: Ubuntu
Description:    Ubuntu 20.04.1 LTS
Release:        20.04
Codename:       focal

# 源文件示例
$ vim /etc/apt/sources.list
...
deb http://us.archive.ubuntu.com/ubuntu/ focal main restricted
# deb-src http://us.archive.ubuntu.com/ubuntu/ focal main restricted
deb http://us.archive.ubuntu.com/ubuntu/ focal-updates main restricted
...
deb http://us.archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
...
```

可以通过 `man sources.list` 查看帮助，格式为：

```bash
deb [ option1=value1 option2=value2 ] uri suite [component1] [component2] [...]
deb-src [ option1=value1 option2=value2 ] uri suite [component1] [component2] [...]
```

- **Types**  可以为 `deb` 、`deb-src` 
- **URIs**:  支持 `http`、 `ftp`、 `file` 等
- **Suites**:  是 Ubuntu 的版本代号，通过 `lsb_release -sc` 获取，这里是 `focal`
  - `focal-updates` 推荐更新
  - `focal-security`  重要的安全更新
  - `focal-backports` 不支持的更新
  - `focal-proposed` 预发布更新
- **Components...** 可以写多个，是 http://mirrors.163.com/ubuntu/dists/focal/ 下的子文件夹
  - `main` 完全的自由软件
  - `restricted` 不完全的自由软件
  - `universe` 全靠社区支持的补丁
  - `muitiverse` 非自由软件，完全不提供支持和补丁
- 下载 http://mirrors.163.com/ubuntu/dists/focal/main/binary-amd64/Packages.gz 解压后查看，文件内容是包的索引，如下：
  - 与 `cat /var/lib/dpkg/status` 内容类似

```
Package: accountsservice
Architecture: amd64
Version: 0.6.55-0ubuntu11
Priority: standard
Section: gnome
Origin: Ubuntu
...
Depends: dbus, libaccountsservice0 (= 0.6.55-0ubuntu11), libc6 (>= 2.4), libglib2.0-0 (>= 2.44), libpolkit-gobject-1-0 (>= 0.99)
Suggests: gnome-control-center
Filename: pool/main/a/accountsservice/accountsservice_0.6.55-0ubuntu11_amd64.deb
Size: 60940
MD5sum: 87a0e27c83950d864d901ceca0f2b49c
...

Package: acct
Architecture: amd64
Version: 6.6.4-2
...
```



## 替换国内源

> - 以下为 aliyun 的 Ubuntu 20.04(focal) 版本的 `sources.list`， 可对比以上格式说明进行理解
> - https://developer.aliyun.com/mirror/ubuntu

```bash
deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
```



## Read More

- [SourcesList](https://wiki.debian.org/SourcesList)
- [SOURCES.LIST(5)](https://manpages.debian.org/jessie/apt/sources.list.5.en.html)















