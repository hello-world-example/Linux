
# 网络接口配置文件 ifcfg-eth0

## 配置参数说明 

- TYPE：配置文件接口类型。在/etc/sysconfig/network-scripts/目录有多种网络配置文件，有Ethernet 、IPsec等类型，网络接口类型为Ethernet。
- DEVICE：网络接口名称
- **BOOTPROTO**：系统启动地址协议
	- none：不使用启动地址协议
	- bootp：BOOTP协议
	- **dhcp**：DHCP动态地址协议
	- **static**：静态地址协议
- **ONBOOT**：系统启动时是否激活
	- **yes**：系统启动时激活该网络接口
	- no：系统启动时不激活该网络接口
- **IPADDR**：IP地址
- **NETMASK**：子网掩码
- **GATEWAY**：网关地址
- BROADCAST：广播地址
- HWADDR/MACADDR：MAC地址。只需设置其中一个，同时设置时不能相互冲突。
- **PEERDNS**：是否指定DNS。如果使用DHCP协议，默认为yes。
	- yes：如果DNS设置，修改/etc/resolv.conf中的DNS
	- no：不修改/etc/resolv.conf中的DNS
- **DNS{1, 2}**：DNS地址。当PEERDNS为yes时会被写入/etc/resolv.conf中。
- NM_CONTROLLED：是否由Network Manager控制该网络接口。修改保存后立即生效，无需重启。被其坑过几次，建议一般设为no。
	- yes：由Network Manager控制
	- no：不由Network Manager控制
- USERCTL：用户权限控制
	- yes：非root用户允许控制该网络接口
	- no：非root用户不运行控制该网络接口
- IPV6INIT：是否执行IPv6
	- yes：支持IPv6
	- no：不支持IPv6
- IPV6ADDR：IPv6地址/前缀长度


## 静态IP 配置
```
ONBOOT=yes
BOOTPROTO=static
IPADDR=192.168.31.6
GATEWAY=192.168.31.1
NETMASK=255.255.255.0
```

## 配置生效
```
service network restart  
```

## Read More
- [Linux网络接口配置文件ifcfg-eth0解析](http://blog.csdn.net/jmyue/article/details/17288467)