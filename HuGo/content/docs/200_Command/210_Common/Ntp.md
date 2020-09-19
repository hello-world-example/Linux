---
title: "ntp"
weight: 11
---



# NTP（Network Time Protocol）

{{< hint info >}} **相关** ：[date 命令](../Date/) 、 [时区设置](/Docker/docs/FAQ/TimeZone/) {{< /hint >}}



## 简介

- `ntp` ：Network Time Protocol 网络时间协议
- `ntpdate` ：命令，断点更新，会造成时间的跳跃，单独使用时一般需要 配置 `crontab` 定时更新
- `ntpd` ：服务，逐渐调整时间，好于 `ntpdate + cron` 组合
  - `ntpd` 服务在时间差距过大（1000秒）的时候会同步失败
  - 需要先使用 `ntpdate` 强制更新，再使用 `ntpd` 逐步调整
- NTP 服务的通信端口为 `UDP 123`
- `CST` ：China Standard Time 时区



## ntpdate 强制更新

```bash
$ ntpdate ntp.ntsc.ac.cn
```



### the NTP socket is in use, exiting

> `ntpdate` 和 `ntpd` 不能同时使用，会出现端口占用的情况，需要先关掉 `ntpd`

```bash
# 查看端口占用
$ lsof -i :123
COMMAND  PID USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
ntpd    4814  ntp   16u  IPv4 72066131      0t0  UDP localhost:ntp 

# 先关闭 ntpd 服务
$ service ntpd stop

# 同步时间
$ ntpdate ntp.aliyun.com
18 Sep 12:57:55 ntpdate[4802]: step time server 203.107.6.88 offset 28937.599627 sec

# 开启 ntpd 服务
$ service ntpd start

###
### service ntpd stop;  ntpdate ntp.ntsc.ac.cn;  service ntpd start
###
```



## ntpd 相关配置

### /etc/ntp.conf

#### 示例

```bash
# 系统时间与 BIOS 时间的偏差记录
driftfile /var/lib/ntp/drift

# 默认拒绝
restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery

# 本地服务没有任何限制
restrict 127.0.0.1 
restrict -6 ::1

# 172.16.0.1 ~ 172.16.0.254 的机器，都可以使用该机器进行时间同步
# restrict 172.16.2.0 mask 255.255.255.0 nomodify notrap

# 限制为 172.16.0.1 ~ 172.16.0.254 这些IP段的服务器提供 NTP 服务
# restrict 172.16.2.0 mask 255.255.255.0 notrust nomodify notrap noquery


# prefer 标示优先
# server 172.16.2.218 prefer 
# 建议配置多个
server ntp.aliyun.com iburst
server ntp1.aliyun.com iburst
server ntp2.aliyun.com iburst

# 作为 Server 配置
# fudge 127.0.0.1 stratum 6

# includefile /etc/ntp/crypto/pw
# keys /etc/ntp/keys
# disable monitor
```



#### restrict 安全配置

- 格式 `restrict IP地址 mask 子网掩码 参数`
- IP 为 default 时 指所有的IP
- 参数如果没有设置，代表没有任何限制
  - `-6` 表示 IPV6 地址的权限设置
  - `kod` ： 访问违规时发送 KoD 包
  - `nomodify`：客户端不能更改服务端的时间参数，但是客户端可以通过服务端进行网络校时
  - `notrap` ：不提供 trap 远端登陆
  - `nopeer` ：用于阻止主机尝试与服务器对等并允许欺诈性服务器控制时钟
  - `noquery` ：禁止客户端查询，用户端不能使用 `ntpq`、`ntpc` 等命令来查询 ntp 服务器
  - `notrust` ：客户端需要通过认证才能查询
  - `ignore`：关闭所有的 NTP 联机服务



### /etc/sysconfig/ntpd

- ntp 服务 默认只会同步系统时间
- 如果想要让 ntp 同时同步硬件时间，需要设置 `/etc/sysconfig/ntpd` 文件
- 可通过 `hwclock -w` 手动同步一次

```bash
$ vim /etc/sysconfig/ntpd
SYNC_HWCLOCK=yes
```



## ntpq 查看状态

```bash
# 如果 reach 为 0 说明没有成功
$ ntpq -p

# 定时查看
$ watch -d -n1 "ntpq -p"

# 如果 stratum=16 说明没有同步成功
$ ntpq -c rv | grep stratum

# 查看 ntpd 失败原因
$ tail -fn 400 /var/log/messages | grep ntpd

# 查看 ntpd 服务状态
$ service ntpd status

# 查看 ntp 服务器有无和上层 ntp 连通
$ ntpstat
synchronised to NTP server (120.25.115.20) at stratum 3 
   time correct to within 31 ms
   polling server every 128 s
  
# 未同步
$ ntpstat
unsynchronised
   polling server every 8 s

# 查看防护墙是否关闭
$ ntpstat
timeout
```

- `remote`：ntp 服务器在 `ntp.conf` 中定义
  - `*`  表示**当前使用的**，也是最好的源
  - `+` 表示这些源可作为 NTP 源
  - `-`、`x` 源是不可用的
- `refid`：远程的服务器进行同步的更高一级服务器
- `st`：ntp 服务器的 Stratum 级别，NTP 时间同步是分层的
- **`when`**：最后一次同步到现在的时间，单位秒
- `poll`：同步的频率，单位2的指数次秒，4=16s
- **`reach`**：最近8次时钟同步包接收情况的 8进制树
  - 377 -> 11111111，代表最近 8 次都成功
  - 177 -> 1111111，代表最近 7 次都成功
  - 77 -> 111111，代表最近 6 次都成功
- **`delay`**：从本地到，程节点或服务器通信的往返时间，单位毫秒
- **`offset`**：与服务器时间源的时间偏移量，单位毫秒
- **`jitter`**：与远程节点同步的时间源的平均偏差，单位毫秒



### Name or service not known

> [执行 ntpq -p 报错：Name or service not known](https://blog.csdn.net/u014774648/article/details/91786269)

```bash
$ vim /etc/hosts
127.0.0.1  localhost
```



## ntp 同步原理

> [NTP时间服务器工作原理](https://www.centos.bz/2012/09/ntp-time-server-working-principle/)

- 设备A 发送一个NTP报文给 设备B，该报文带有它离开 设备A 时的时间戳，该时间戳为 **10:00:00 (T1)**
- 当此 NTP报文 到达 设备B 时，设备B 加上自己的时间戳，该时间戳为 **11:00:01 (T2)**
- 当此 NTP报文 离开 设备B 时，设备B 再加上自己的时间戳，改时间戳为 **11:00:02（T3）**
- 当设备A 接收到该响应报文时，设备A 的本地时间为 **10:00:03 (T4)**
- 至此，设备A已经拥有足够的信息来计算两个重要的参数：
  - NTP 报文的往返时延 `Delay = (T4-T1)-(T3-T2)` = 2 秒
  - 设备A 相对 设备B 的时间差 `Offset = ((T2-T1)+(T3-T4))/2` = 1小时
- 这样，设备A 就能够根据这些信息来设定自己的时钟，使之与 设备B 的时钟同步



## NTP 服务器

- `ntp.ntsc.ac.cn`  中国国家授时中心
- `ntp.aliyun.com`  阿里云 ntp 服务器
- www.pool.ntp.org 找到离我们城市最近的 ntp Server



## Read More

- [support.ntp.org](http://support.ntp.org/bin/view/Main/WebHome)
- [阿里云NTP服务器](https://help.aliyun.com/document_detail/92704.html)
- [配置 Linux 实例 NTP 服务](https://help.aliyun.com/document_detail/92803.html)
- [Linux的NTP配置总结](https://www.cnblogs.com/kerrycode/p/4744804.html)