
# lsof ( List Open Files)



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
  - service -->` /etc/services` 文件中的 service name
  - port --> `端口号`



## 示例

- `lsof -i :8080`  查看8080端口的运行情况
- `lsof -a -u root -d txt`  查看**所属root用户进程**所打开的**文件类型为txt的文件**