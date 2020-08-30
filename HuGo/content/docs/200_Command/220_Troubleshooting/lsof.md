---
title: lsof ( List Open Files)
---



# lsof ( List Open Files)



## 参数

- `lsof  filename` 显示打开指定文件的所有进程
- `lsof -c string`   显示command列中包含指定字符的**进程所有打开的文件**
- `lsof -p pid`   指定**进程所有打开的文件**
- 
- `lsof +d /DIR/` 显示目录下被进程打开的文件
- `lsof +D /DIR/` 同上，但是会搜索目录下的所有目录，时间相对较长

- 
- `lsof -u username`  显示所属user进程打开的文件
- `lsof -g gid` 显示归属gid的进程情况
- `lsof -d FD` 显示指定文件描述符的进程
- 
- `lsof -a` and 操作 
- `lsof -i` 显示符合条件的进程，格式：`lsof -i[46][protocol][@hostname|hostaddr][:service|port]`
  - `46` --> IPv4 or IPv6
  - protocol --> `TCP` or `UDP`
  - hostname --> Internet host name
  - hostaddr --> `IPv4地址`
  - service --> `/etc/services` 文件中的 service name
  - port --> `端口号`





## FD

- `cwd`： current work dirctory，应用程序的当前工作目录
- `txt` ：进程程序代码
- .u： 该文件被打开并处于 读/写 模式
- .r： 该文件被打开并处于 只读模式

> 更多详见： `man lsof`



## TYPE

- `DIR`：目录
- `REG`：文件
- `IPv4`：网际协议 (IP) 套接字
- unix： UNIX 域套接字
- KQUEUE： 内核时间队列

> 更多详见： `man lsof`



## 案例



### 网络相关

``` bash
# 列出所有的网络连接
$ lsof -i

# 查看端口占用
$ lsof -i :8080  

# 所有 TCP 网络连接信息
$ lsof -i tcp
# 所有 UDP 网络连接信息
$ lsof -i udp
```



### 文件占用

```bash
# 打开 lsof.md 文件的进程（pid）
$ lsof lsof.md

# 当前目录下的文件被哪些进程打开（pid）
$ lsof +d .

# 查看进程打开的所有文件句柄
$ lsof -p 86221
$ lsof -c hugo
$ lsof -c hugo -a -d txt

# 进程开启的端口
$ lsof -p 86221 | grep IPv
$ lsof -p 86221 -a -i 4
$ lsof -p 86221 -a -i TCP
# 文件句柄数统计
$ lsof -c hugo | wc -l
```





## Read More

- [ lsof 一切皆文件](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/lsof.html)