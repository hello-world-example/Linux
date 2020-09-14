---
title: rpm 
weight: 10
---



# rpm (Redhat Package Manager)



## 常用

```bash
# 查询过滤
$ rpm -qa | grep <package>

# 查询软件包名，不包含版本
$ rpm -q <package_no_version>

# 卸载
$ rpm -e <package_full_name>

# 安装并显示进度
$ rpm -ivh <package.rpm>
```



## 案例

### 【查询】文件属于哪个包

```bash
$ rpm -qf /usr/bin/ls
coreutils-8.22-24.el7.x86_64

$ rpm -qf /usr/sbin/ip
iproute-4.11.0-25.el7.x86_64
```



### 【查询】已安装包 "安装到何处"

```bash
$ rpm -ql coreutils-8.22-24.el7.x86_64 | grep /bin
..
/usr/bin/cp
/usr/bin/csplit
/usr/bin/cut
/usr/bin/date
/usr/bin/dd
/usr/bin/df
..
```



### 【查看】已安装软件 "包信息 "

```bash
# rpm -qi coreutils
$ rpm -qi coreutils-8.22-24.el7.x86_64
Name        : coreutils
Version     : 8.22
Release     : 24.el7
Architecture: x86_64
Install Date: Tue 17 Sep 2019 02:40:47 AM CST
Group       : System Environment/Base
Size        : 14593469
License     : GPLv3+
Signature   : RSA/SHA256, Fri 23 Aug 2019 05:21:30 AM CST, Key ID 24c6a8a7f4a80eb5
Source RPM  : coreutils-8.22-24.el7.src.rpm
Build Date  : Tue 20 Aug 2019 02:27:26 PM CST
Build Host  : x86-01.bsys.centos.org
Relocations : (not relocatable)
Packager    : CentOS BuildSystem <http://bugs.centos.org>
Vendor      : CentOS
URL         : http://www.gnu.org/software/coreutils/
Summary     : A set of basic GNU tools commonly used in shell scripts
Description :
These are the GNU core utilities.  This package is the combination of
the old GNU fileutils, sh-utils, and textutils packages.
```



### 【查看】已安装软件包的 "配置文件"

```bash
$ rpm -qc coreutils
/etc/DIR_COLORS
/etc/DIR_COLORS.256color
/etc/DIR_COLORS.lightbgcolor
/etc/profile.d/colorls.csh
/etc/profile.d/colorls.sh
```



### 【查看】已安装软件包的 "文档位置"

```bash
$ rpm -qd coreutils
/usr/share/doc/coreutils-8.22/ABOUT-NLS
/usr/share/doc/coreutils-8.22/COPYING
/usr/share/doc/coreutils-8.22/ChangeLog.bz2
/usr/share/doc/coreutils-8.22/NEWS
/usr/share/doc/coreutils-8.22/README
...
```



### 【查看】已安装软件包的 "依赖"

```bash
$ rpm -qR coreutils  
/bin/sh
/bin/sh
/bin/sh
/sbin/install-info
/sbin/install-info
/sbin/install-info
config(coreutils) = 8.22-24.el7
gmp
grep
...
```



### 【查看】【未安装】软件包的信息

```bash
# 包信息
$ rpm -qpi <package.rpm>

# 包含的文件
$ rpm -qpl <package.rpm>

# 文档位置
$ rpm -qpd <package.rpm>

# 配置文件
$ rpm -qpc <package.rpm>

# 依赖关机
$ rpm -qpR <package.rpm>
```



## Read More

- [RPM 命令](http://math.ecnu.edu.cn/~jypan/Teaching/Linux/command/rpm.htm)

