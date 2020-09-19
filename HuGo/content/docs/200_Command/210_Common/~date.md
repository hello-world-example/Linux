---
title: "date"
weight: 10
---



# date

> - [时区设置](/Docker/docs/FAQ/TimeZone/)



## 常用命令


``` bash
# 当前时间
$ date

# 【临时】设置时间
$ date -s '2020-09-18 11:12:09'

# 显示文件的最后修改时间
$ date -r filename
```



## 日期计算

``` bash
# 显示后一天的日期
date --date="+1 day"  
# 显示前一天的日期
date --date="-1 day"
# 显示上一月的日期
date --date="-1 month"
# 显示前一年的日期
date --date="-1 year"
```



## 格式化输出

``` bash
# 查看完整帮助，包含【时间格式】
$ date --help

$ date +'Format'


# 2020-09-18 11:16:55
$ date +'%F %T'

# 2020-09-18 11:16:55
$ date +'%Y-%m-%d %H:%M:%S'

# 2020年09月18日 星期五 11时18分44秒
$ date +'%c'


# 一年中的第几天
$ date +'%j'

# 自UTC 时间 1970-01-01 00:00:00 以来所经过的秒数
$ date +'%s'

# 纳秒
$ date +'%N'
```



## hwclock 硬件时间

```bash
# 显示硬件时间
$ hwclock --show

# 将当前时间和日期写入硬件，避免重启后失效
$ hwclock -w
```




## Read More
- [Linux date命令的用法](https://www.cnblogs.com/xd502djj/archive/2010/12/29/1919478.html)