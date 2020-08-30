
# ps


## 显示系统中所有进程信息
``` bash
ps -ef
```

## 查看进程资源使用情况
``` bash
ps aux
```


- USER : 用户名
- `%CPU` : 进程占用的CPU百分比
- `%MEM` : 占用内存的百分比
- `VSZ`  : 该进程使用的虚拟內存量（KB）
- `RSS`  : 该进程占用的固定內存量（KB）（驻留中页的数量）
- `STAT` : 进程的状态
- `START` : 该进程被触发启动时间
- `TIME` : 该进程实际使用CPU运行的时间

### 其中STAT状态位常见的状态字符有

- `D` : 无法中断的休眠状态（通常 IO 的进程）；
- R : 正在运行可中在队列中可过行的；
- S : 处于休眠状态；
- `T` : 停止或被追踪；
- W : 进入内存交换 （从内核2.6开始无效）；
- `X` : 死掉的进程 （基本很少见）；
- `Z` : 僵尸进程；
- < : 优先级高的进程
- N : 优先级较低的进程
- L : 有些页被锁进内存；
- s : 进程的领导者（在它之下有子进程）；
- l : 多线程，克隆线程（使用 CLONE_THREAD, 类似 NPTL pthreads）；
- + : 位于后台的进程组；

> [Linux下ps -ef和ps aux的区别及格式详解](http://www.cnblogs.com/5201351/p/4206461.html)


## 查看进程的所有线程

``` bash
ps -fTp <pid>
# 或
ps -efT | grep <进程名>
# 或
ps aux -T | sed -n '1p;/<进程名>/p'
```

``` 输出
UID        PID  SPID  PPID  C STIME TTY          TIME CMD
root     13824 13824 13671  0 12:52 pts/1    00:00:00 java Main
root     13824 13825 13671  0 12:52 pts/1    00:00:00 java Main
root     13824 13826 13671  0 12:52 pts/1    00:00:00 java Main
root     13824 13827 13671  0 12:52 pts/1    00:00:00 java Main
root     13824 13828 13671  0 12:52 pts/1    00:00:00 java Main
root     13824 13829 13671  0 12:52 pts/1    00:00:00 java Main
root     13824 13830 13671  0 12:52 pts/1    00:00:00 java Main
root     13824 13831 13671  0 12:52 pts/1    00:00:00 java Main
...
```

字段说明：

- UID：运行进程的用户
- PID：进程号
- SPID：线程ID
- PPID：父进程ID
- `C`：CPU调度情况
- STIME：进程启动时间
- TTY：终端号
- `TIME`：进程使用CPU时间
- CMD：启动进程的命令

## 查看当前终端中运行的进程

```bash
ps -Tl
```

> [每天一个linux命令（41）：ps命令](http://www.cnblogs.com/peida/archive/2012/12/19/2824418.html)