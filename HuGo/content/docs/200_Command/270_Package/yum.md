---
title: yum
weight: 20
---



# yum  (Yellow dog Update Modifier)



- 自动化地 升级/安装/移除 rpm包，收集 rpm包 的相关信息，检查依赖性并自动提示用户解决
- 关键之处是要有可靠的 repository，可以是 HTTP、FTP、本地 站点
- `/etc/yum.conf` 配置文件
-  `/etc/yum.repos.d/` 仓库配置



## 常用命令

```bash
# 查看帮助
$ yum help

# 查找软件包
$ yum list | grep <package>
# 查找已安装的包
$ yum list installed

# 安装
$ yum install <package>
$ yum reinstall <package>

# 卸载
$ yum remove <package>

# 查看包信息
$ yum info <package>

# 查看日志
$ tail -fn 400 /var/log/yum.log
```

### 更新

```bash
# 查看可用的更新
$ yum check-update

#【慎用】更新所有 rpm 包，也升级系统内核
$ yum update

# 指定更新
$ yum update bash.x86_64

# 更新所有 rpm 包，不升级系统内核
$ yum upgrade bash.x86_64
```





## 配置 /etc/yum.repos.d/*.repo



### 相关命令

```bash
# 查看 可用的 仓库列表
$ yum repolist

# 查看所有仓库列表，并显示是否可用，通过 enabled={0|1} 控制，默认 1 可用
$ yum repolist all
$ yum repolist enable


# 增加仓库
$ yum-config-manager --add-repo http://kail.test
# 禁用仓库
$ yum-config-manager --disable repository
# 启用仓库
$ yum-config-manager --enable repository
# 删除仓库
$ rm /etc/yum.repos.d/kail.test.repo
```



### *.repo 文件格式

> [SETTING [REPOSITORY] OPTIONS](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-setting_repository_options)

```properties
# 仓库 ID
[base]
# 仓库 名称，
name=CentOS-$releasever - Base

# 仓库 镜像列表地址，是多个 baseurl 的集合
# 这里是 http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=os&infra=stock
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra

# 仓库地址，可以是 http://、ftp://、file:// 协议
# baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/

# 仓库是否可用
enabled=1

# gpg 校验
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
```





## yum 变量

> - [USING YUM VARIABLES](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-Using_Yum_Variables)
>
> - ❤ `/etc/yum/vars/*` 中定义的变量优先级最该



- `$releasever` 
  - 获取 `/etc/yum.conf` 的 `distroverpkg` 的值
  - 根据该值获取对应的 rpm 包名
  - 获取到这个 rpm 包的 release 版本号 就是这个变量的值
- `$basearch` 是 `arch` 命令的结果，如：`x86_64`
- `$infra` 是 `cat /etc/yum/vars/infra` 为 `stock`



**通过 Pyhton 获取 yum 变量的值**

```bash
$ python -c 'import yum; print(yum.YumBase().conf.yumvar)' 

{
  'uuid': '9a71351f-af16-45fc-afce-8897782011ba', 
  'contentdir': 'centos', 
  'basearch': 'x86_64', 
  'infra': 'stock', 
  'releasever': '7', 
  'arch': 'ia32e'
}
```



## /etc/yum.conf 

``` properties
[main]
# yum 缓存的目录，在此存储下载的rpm 包和数据库
cachedir=/var/cache/yum/$basearch/$releasever
# 安装完成后是否保留软件包，0为不保留，1为保留
keepcache=0
# Debug 信息输出等级，范围为 0-10
debuglevel=2
# yum 日志文件位置，❤ 查询过去所做的更新
logfile=/var/log/yum.log
#【1】则只会安装和系统架构匹配的软件包
exactarch=1
# 允许更新陈旧的 RPM 包
obsoletes=1
# 否是进行 gpg(GNU Private Guard) 校验，以确定 rpm 包的来源是有效和安全的
gpgcheck=1
# 是否启用插件
plugins=1
# 允许并行同时安装
installonly_limit=5
bugtracker_url=http://bugs.centos.org/set_project.php?project_id=23&ref=http://bugs.centos.org/bug_report_page.php?category=yum
# $releasever 变量的值，
distroverpkg=centos-release

# 屏蔽不想更新的 RPM
exclude=selinux*
```





## 镜像仓库加速

> https://developer.aliyun.com/mirror/

### 备份 CentOS-Base.repo

```bash
$ mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
```

### 163

```bash
$ curl -o /etc/yum.repos.d/CentOS-163-7.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
```

### aliyun

```bash
$ curl -o /etc/yum.repos.d/CentOS-Ali-7.repo https://mirrors.aliyun.com/repo/Centos-7.repo
```

### 生成缓存

```bash
$ yum clean all
$ yum makecache

# 查看 可用的 仓库列表
$ yum repolist
```





## Read More

- [CONFIGURING YUM AND YUM REPOSITORIES](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-configuring_yum_and_yum_repositories)
  - [CREATING A YUM REPOSITORY](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-yum_repository) 自建仓库
- [CentOS yum 源的配置与使用](https://www.cnblogs.com/mchina/archive/2013/01/04/2842275.html)