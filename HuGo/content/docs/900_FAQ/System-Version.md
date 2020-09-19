---
bookHidden: true
---



# 查看系统版本



## CentOS

```bash
$ cat /etc/centos-release
CentOS release 6.7 (Final)
```



## Ubuntu

```bash
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04.1 LTS"
```



## Common

```bash
$ cat /proc/version
Linux version 2.6.32-431.29.2.el6.x86_64 (root@xxx) (gcc version 4.4.7 20120313 (Red Hat 4.4.7-11) (GCC) ) #1 SMP Wed Sep 16 11:10:09 CST 2015

# 内核版本
$ uname -r
2.6.32-431.29.2.el6.x86_64

# 架构
$ uname -i
x86_64

$ uname -a
Linux localhost 2.6.32-431.29.2.el6.x86_64 #1 SMP Wed Sep 16 11:10:09 CST 2015 x86_64 x86_64 x86_64 GNU/Linux
```

