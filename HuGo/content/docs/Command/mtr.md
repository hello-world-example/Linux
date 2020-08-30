# mtr

常用的 `ping`，`tracert`，`nslookup` 一般用来判断主机的网络连通性，其实 Linux 下有一个更好用的网络联通性判断工具，它可以结合  `ping`、`tracert`、`nslookup`  来判断网络的相关特性，这个命令就是 `mtr`。`mtr` 全称 **my traceroute**，是一个把 ping 和 traceroute 合并到一个程序的网络诊断工具。

traceroute 默认使用UDP数据包探测，而mtr默认使用ICMP报文探测，**ICMP在某些路由节点的优先级要比其他数据包低，所以测试得到的数据可能低于实际情况**。



## 常用命令

- 无参数（`mtr <host>`）：会不停的发送 CMP报文 进行探测

- `-r` | `-report` : 会向主机发送 10 个 ICMP 包，然后直接输出结果 

  > 一般情况下 mtr 前几跳都是本地 ISP，后几跳属于服务商比如 Google 数据中心，中间跳数则是中间节点，如果发现前几跳异常，需要联系本地 ISP 服务提供上，相反如果后几跳出现问题，则需要联系服务提供商，中间几跳出现问题，则两边无法完全解决问题 

- `-c`：  `-r` 参数来生成报告，只会发送10个数据包 ， 可以通过 `-c` 制定发送数据包的个数

- `-s`：定ping数据包的大小 ，如果设置为负数，则数据包大小是随机数



## 统计项说明

- `Host`：显示的是IP地址或本机域名
- `Loss%` 到达此节点的数据包丢包率，显示的每个对应IP的丢包率（TODO）
- `Snt `发送包的数量
- `Last` 最后一包的返回延时
- `Avg` 平均延时
- `Best` 最低延时
- `Wrst` 最差延时
- `StDev` 方差（稳定性）



## Read More

- [mtr 查看路由网络连通性](http://einverne.github.io/post/2017/11/mtr-usage.html)
- [traviscross/mtr](https://github.com/traviscross/mtr)
- 工具：[在线 traceroute](https://tools.ipip.net/traceroute.php)