#!/bin/bash

function foo() {
  echo "foo function"
}

# function 可写可不写
bar() {
  echo "bar function"
  # 默认是最后一条命令的运行结果
  # 只能返回数字，范围 0~255
  return 255
}

# 调用两个函数
foo
# foo 函数的返回 code
echo $?

bar
# bar 函数的返回 code
echo $?

function param() {
    echo "当前 shell 文件名 ： $0"
    echo "当前函数第 1 个参数：  $1"
    echo "当前函数第 10个参数：  ${10}"
    echo ""
    echo "当前函数参数个数   ：  $#"
    echo "当前函数'所有'参数 ：  $*"
    echo "当前函数'每个'参数 ：  $@"
    echo ""
    echo "当前进程ID       ：   $$"
    echo "最后一个进程ID    ：   $!"
    echo "当前选项         ：   $-"
    echo "退出状态         ：   $?"
}

param 11 22 33 44 55 66 77 88 99 1010 1111