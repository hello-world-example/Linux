---
bookHidden: true
---



# 修改主机名



## 临时修改

```bash
# 当前主机名
$ hostname

# 临时修改
$ hostname kail.pc
```



## CentOS 永久修改

```bash
# 1. 新增或修改 HOSTNAME
$ vim /etc/sysconfig/network
HOSTNAME=kail.pc

# 2. hosts 映射
$ vim /etc/hosts
127.0.0.1 kail.pc
```



## Ubuntu 永久修改

```bash
$ vim /etc/hostname
kail.pc

# 重启后查看
$ reboot
```

