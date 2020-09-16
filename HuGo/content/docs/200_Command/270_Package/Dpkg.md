---
title: dpkg 
weight: 30
---



# dpkg (Debian Package)



## 常用

```bash
# 查询过滤
$ dpkg -l | grep <package>

# 卸载
$ dpkg -P package-name    # 删除软件包（包括配置信息） -P --purge
$ dpkg -r package-name    # 删除软件包（保留配置信息） -r --remove

# 安装
$ dpkg -i <package-name.deb>                
```



## 案例

### 【查询】文件属于哪个包

> -S 后面必须跟文件，不能跟 链接

```bash
$ dpkg -S /bin/ls
coreutils: /bin/ls

$ dpkg -S /bin/ip
iproute2: /bin/ip
```



### 【查询】已安装包 “安装到何处”

```bash
$ dpkg -L coreutils | grep bin
/bin
/bin/cat
/bin/chgrp
/bin/chmod
/bin/chown
/bin/cp
/bin/date
/bin/dd
..
```



### 【查看】已安装软件 “包信息 "

```bash
# cat /var/lib/dpkg/status
$ dpkg -s coreutils

Package: coreutils
Essential: yes
Status: install ok installed
Priority: required
Section: utils
Installed-Size: 7196
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Architecture: amd64
Multi-Arch: foreign
Version: 8.30-3ubuntu2
Pre-Depends: libacl1 (>= 2.2.23), libattr1 (>= 1:2.4.44), libc6 (>= 2.28), libselinux1 (>= 2.1.13)
Description: GNU core utilities
 This package contains the basic file, shell and text manipulation
 utilities which are expected to exist on every operating system.
...
```



### 【查看】【未安装】软件包的信息

```bash
# 列出软件包内容
$ dpkg -c package-name.deb                

# 查看软件包信息
$ dpkg -I package-name.deb
```



## 相关文件介绍
```bash
# 软件的配置文件
$ cat /etc/dpkg/dpkg.cfg

# dpkg包管理软件的日志文件
$ cat /var/log/dpkg.log

# 存放系统所有安装过的软件包信息
$ cat /var/lib/dpkg/available

# 存放系统现在所有安装软件的状态信息
$ cat /var/lib/dpkg/status

# 记安装软件包控制目录的控制信息文件
$ ll /var/lib/dpkg/info
```



## Read More

- [apt 和 dpkg 快速参考](http://wiki.ubuntu.org.cn/Apt%E5%92%8Cdpkg%E5%BF%AB%E9%80%9F%E5%8F%82%E8%80%83)