# tcpdump



## 常用参数

- `tcpdump -D` 查看可以监听的接口列表

- `-i <eth0>` 指定网卡，可通过 `tcpdump -D`  查看

- `-c <n>` 专区指定个数的包之后退出

- **`-w <file.pcap>`** 数据写入到磁盘，可用 Wireshark 打开进行分析

- **`-s <snaplen>`** 默认 64字节，设置为 0 会自动选择合适的长度来抓取数据包

- `-v` | **`-vv`** | `-vvv` 输出更加详细的信息

  

## 特定协议

- `tcpdump tcp`
- `tcpdump udp`

## 特定 IP 或 主机

- **`tcpdump host <ip>`**
- `tcpdump host <ip1> and <ip2>` 抓取 ip1 和 ip2 之间的流量
- `tcpdump dst [host] <ip>` 抓取出站信息（**只有请求**没有响应）
- `tcpdump src [host] <ip>` 抓取入站信息（**只有响应**没有请求）
- 

## 特定端口

- `tcpdump port <port>`

- 



## Read More 

- [官网](http://www.tcpdump.org/)
- [tcpdump使用技巧](https://linuxwiki.github.io/NetTools/tcpdump.html)
- [Linux tcpdump命令详解](https://www.cnblogs.com/ggjucheng/archive/2012/01/14/2322659.html)

- IBM [tcpdump 命令](https://www.ibm.com/support/knowledgecenter/zh/ssw_aix_72/com.ibm.aix.cmds5/tcpdump.htm)