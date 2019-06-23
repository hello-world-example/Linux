
[TOC]


# SSH 隧道

## 公共参数

``` bash
# Fork into background after authentication. 
# 后台认证用户/密码，通常和-N连用，不用登录到远程主机
-f

# Enable compression. 
# 压缩数据传输。
-C 
 
# Do not execute a shell or command. 
# 不执行脚本或命令，通常与-f连用。
-N 

# Allow remote hosts to connect to forwarded ports. 
# 允许远程主机连接到建立的转发的端口
-g
```

## 本地端口转发 `-L`

**将 `本地/跳板机` 的某个端口`通过跳板机`转发到远端指定机器的指定端口**。

**格式 ：（本机/跳板机）** ` ssh -Nfg -L <执行的机器port>:<受限机IP>:<受限机port> <跳板机IP>`

**访问方式 ：（本机）**`<执行的机器IP>:<执行的机器port>` --> `<受限机IP>:<受限机port>`


---------------------------------------------





## 动态端口转发 `-D`

动态端口允许通过配置一个本地端口，把通过隧道的数据转发到远端的所有地址。**相当于一个 socks5 代理**

**格式 ：（本机/代理机）** ` ssh -Nfg -D [bind_address]:<代理端口> <username>@<跳板机IP/提供代理服务的机器IP>`
**访问方式 ：（随便一台机器）**  `curl --socks5 <跳板机IP/提供代理服务的机器IP>:<代理端口> http://www.baidu.com`


---------------------------------------------




## 远端端口转发 `-R`


**格式：(在内网机器执行)** `ssh -Nfg -R <外网机器port>:<内网机IP>:<内网机port> <外网机器IP>`
**访问方式（在外网机器） ：** `访问内网  <外网机器IP>:<外网机器port>`


---------------------------------------------


## 使用技巧 

### 保持长时间链接

ssh 加上 `-o TCPKeepAlive=yes` 参数


## 常见错误

### channel 1: open failed: administratively prohibited: open failed
``` bash
# 1. 修改 ssh 配置文件
vim /etc/ssh/sshd_config

# 2. AllowTcpForwarding 改为 yes

# 3. 重启 sshd
service sshd restart

```


## Read More

> [SSH隧道与端口转发及内网穿透](http://blog.creke.net/722.html)
