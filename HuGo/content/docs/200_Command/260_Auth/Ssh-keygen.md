---
title: ssh-keygen 免密登陆
weight: 20
---





# ssh-keygen 免密登陆



## 相关文件

- `id_rsa` ： 私钥
- `id_rsa.pub` ： 公钥 
- **`authorized_keys`** ： 保存已经授权的客户端公钥；A 到 B 免密登陆，需要 把 A 的 `id_rsa.pub` 公钥，追加到 B 的 `authorized_keys` 文件中
- `known_hosts`：ssh 没有类似于 https 的证书，需要认为确认链接是否可信
  - A 访问 B 时，会把 B 的公钥记录在其中，当下次访问相同计算机时，会核对公钥，如果不同会发出警告
  - 如需关闭检查需修改配置，`~/.ssh/config` （/etc/ssh/sshd_config ）
    - `StrictHostKeyChecking no`
    - `UserKnownHostsFile /dev/null`



## 如何配置

```bash
# 生成 公钥和私钥
# -t 加密算法
# -P 提供密码直接生成
# -f 文件名
$ ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa -C "备注，一般设置为主机名和邮箱等"

$ ll .ssh/
id_rsa       # 私钥
id_rsa.pub   # 公钥


# 当前机器 到 当前机器的免密登陆
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Copy 公钥到 kail.xyz， 并设置权限
$ ssh -p2208 kail.xyz "mkdir -p .ssh && cat >> .ssh/authorized_keys" < .ssh/id_rsa.pub
$ ssh -p2208 kail.xyz "chmod g-w .ssh && chmod 600 .ssh/authorized_keys"
```



## 常见问题

### .ssh 权限配置

> [解决SSH免密登录配置成功后不生效问题](https://blog.csdn.net/lisongjia123/article/details/78513244)

```bash
# 查看权限日志
$ sudo cat /var/log/secure

# 需改文件权限
$ chmod g-w ~/.ssh
$ chmod 600 ~/.ssh/authorized_keys
```

### 公钥登陆需要开启

```bash
$ /etc/ssh/sshd_config  
RSAAuthentication yes
PubkeyAuthentication yes
```





## 免密原理

- A 链接 B 时同时发送 公钥
- B 获取公钥后对比 `authorized_keys` 是否包含 A 的公钥
- 如果包含 通过 A 公钥加密 交换信息 回传给 A
- 交换信息 只有 A 的私钥可以解密
- A 私钥加密，B 含有 A的 公钥解密



## Read More

- [ssh免密登陆](https://blog.51cto.com/12085228/1958336) 以及常见问题
- [SSH known_hosts 文件](https://zdyxry.github.io/2019/12/06/SSH-known-hosts-%E6%98%BE%E7%A4%BA-IP-%E5%9C%B0%E5%9D%80/)
- [SSH原理与运用（一）：远程登录](http://www.ruanyifeng.com/blog/2011/12/ssh_remote_login.html)
- [SSH原理与运用（二）：远程操作与端口转发](http://www.ruanyifeng.com/blog/2011/12/ssh_port_forwarding.html)