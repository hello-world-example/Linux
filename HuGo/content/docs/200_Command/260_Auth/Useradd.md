---
title: useradd 创建账户
weight: 10
---





# useradd 创建账户



- `useradd` 是一个 linux 命令，但是它提供了很多参数在用户使用的时候根据自己的需要进行设置
- `adduser` 是一个 perl 脚本，在使用的时候会出现类似 **人机交互的界面，提供选项让用户填写和选择**，常见在 Ubuntu 系统下
- 有时又是同一个命令： `/usr/sbin/adduser -> useradd` ，即 `adduser` 会 链接到 `useradd`



## Quick Start

> 【注意】 以下操作需要在 root 账户权限下操作

```bash
# 创建 kail 用户，并 生成 /home/kail 工作目录
$ useradd -m kail

# 为 kail 用户 设置密码
$ passwd kail

# 删除 kail 用户，并同时删除 /home/kail 工作目录
$ userdel -r kail
```



## useradd

- `-m`  (默认)自动建立工作目录
- `-M` 不自动建立工作目录
- `-c` 账户备注，默认空字符串，`cat /etc/passwd | grep kail` 查看备注
- 
- `-e` 指定账号的有效期限，缺省表示永久有效
- `-f`  指定在密码过期后多少天即关闭该账号
- `-r`：建立系统账号



## userdel

- `无参数` 只删除用户，不删除工作目录
- `-r, --remove` 同时删除工作目录
- `-f, --force` 强制删除，例如登陆中的用户



## usermod 修改账户

- `usermod -l <new_name> <old_name>` 修改用户名
- `usermod -d <new_home> <user_name>` 修改工作路径
- `usermod –g <group_name> <user_name>`  将用户添加到用户组





## Read More

- [Linux中添加、修改和删除用户和用户组](https://my.oschina.net/junn/blog/138939)



