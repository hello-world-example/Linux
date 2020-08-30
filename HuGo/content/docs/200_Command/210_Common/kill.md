# kill

**kill**命令用来删除执行中的程序或工作。
将指定的信号送至程序。
默认的信息为**SIGTERM(15)**,可将指定程序终止。
若仍无法终止该程序，可使用 **SIGKILL(9)** 强制删除程序。

## 选项

```
-l <信息编号>：若不加<信息编号>选项，则-l参数会列出全部的信息名称；
-s <信息名称或编号>：指定要送出的信息；

-a：当处理当前进程时，不限制命令名和进程号的对应关系；
-p：指定kill 命令只打印相关进程的进程号，而不发送任何信号；
-u：指定用户。
```

## 示例

``` bash
$ kill -l

 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL
 5) SIGTRAP      6) SIGABRT      7) SIGBUS       8) SIGFPE
 9) SIGKILL     10) SIGUSR1     11) SIGSEGV     12) SIGUSR2
13) SIGPIPE     14) SIGALRM     15) SIGTERM     16) SIGSTKFLT
17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU
25) SIGXFSZ     26) SIGVTALRM   27) SIGPROF     28) SIGWINCH
29) SIGIO       30) SIGPWR      31) SIGSYS      34) SIGRTMIN
35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3  38) SIGRTMIN+4
39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12
47) SIGRTMIN+13 48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14
51) SIGRTMAX-13 52) SIGRTMAX-12 53) SIGRTMAX-11 54) SIGRTMAX-10
55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7  58) SIGRTMAX-6
59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
```

只有`SIGKILL(9)`才可以无条件终止进程，其他信号进程都有权利忽略，下面是常用的信号：

```
HUP     1    终端断线/reload配置文件
KILL    9    强制终止
TERM   15    终止（默认）

INT     2    中断（同 Ctrl + C）
QUIT    3    退出（同 Ctrl + \）
CONT   18    继续（与STOP相反， fg/bg命令）
STOP   19    暂停（同 Ctrl + Z）
```

## HUP

- 它被许多守护进程理解为一个重新设置的请求。如果一个进程不用重新启动就能重新读取它的配置文件并调整自给以适应变化的话，那么HUP通常来触发这种行为。
 
- HUP信号有时候由终端驱动程序生成，试图来"清除"("终止")跟某个特定终端相连的那些进程。例如:某个终端会话结束时，或者当调制解调器被挂断时，shell后台不接受HUP的信号的影响，有的用户可以使用nohup来模仿这种行为。

## Read More
- [**Linux信号（signal) 机制分析**](https://www.cnblogs.com/hoys/archive/2012/08/19/2646377.html)
- 
- [Linux进程KILL－－Quit,INT,HUP,QUIT,和TERM的解释](http://blog.csdn.net/xifeijian/article/details/19286591)