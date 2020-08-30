
# 参数

- `-o <文件名>` **下载网页**
- `-s` **静默退出，不显示 进程和错误信息**
- `-L` 自动跳转到新的网址
- `-i` 显示头和源码
- `-l` **只显示头信息**
- `-v` 显示一次http通信的整个过程，包括端口连接和http request头信息
- `--trace <文件名>` | `--trace-ascii <文件名>`  查看更详细的通信过程



# 发送数据

- `-X POST --data "data=xxx"`  发送表单信息
- `-X POST --data-urlencode "date=April 1"`  提交的信息进行url编码



# 监控

- `curl -o /dev/null -s -w %{http_code} "http://www.baidu.com"` 获取响应码
- `curl -o /dev/null -s -w "code: %{http_code}\ntime_total: %{time_total}\n" "http://www.baidu.com"` 组合使用

可以通过 `man curl` 搜索 `--write-out` 查看更多支持的变量名

- `http_code` 状态码
- `url_effective` 最终获取的url地址，尤其是当你指定给curl的地址存在301跳转，且通过-L继续追踪的情形
- `time_total` 总时间，按秒计。精确到小数点后三位
- `time_namelookup` DNS解析时间,从请求开始到DNS解析完毕所用时间
- `time_connect` 连接时间,从开始到建立TCP连接完成所用时间,包括前边DNS解析时间，如果需要单纯的得到连接时间，用这个time_connect时间减去前边time_namelookup时间
- `time_appconnect` 连接建立完成时间，如SSL/SSH等建立连接或者完成三次握手时间
- `time_pretransfer` 从开始到准备传输的时间
- `time_redirect` 重定向时间，包括到最后一次传输前的几次重定向的DNS解析，连接，预传输，传输时间
- `time_starttransfer` 开始传输时间。在发出请求之后，Web 服务器返回数据的第一个字节所用的时间
- `size_download` 下载大小
- `size_upload` 上传大小
- `size_header`  下载的header的大小
- `size_request` 请求的大小
- `speed_download` 下载速度，单位-字节每秒
- `speed_upload` 上传速度,单位-字节每秒
- `ssl_verify_result ssl` 认证结果，返回0表示认证成功
- ....

> [curl -w,–write-out参数详解](https://www.cnblogs.com/yum777/p/6252310.html)

# 上传文件

- `--form upload=@localfilename --form press=OK` 文件上传



# 设置请求头

- `--referer`
- `--user-agent`
- `--header "Content-Type:application/json"`
- `-u name:password` | `--user name:password`



# 设置 Cookies
- `--cookie`
- `-c cookies.txt`  保存到文件
- `-b cookies.txt` 使用文件中的Cooke