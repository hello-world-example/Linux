#!/bin/bash

str="123/465/789"

echo $str
echo
echo "字符串长度"
echo ${#str}
echo
echo "删除左侧"
echo ${str#*/}
echo ${str##*/}
echo
echo "删除右侧"
echo ${str%/*}
echo ${str%%/*}
echo
echo "字符串替换"
echo ${str/\//.}
echo ${str//\//.}
echo
echo "字符串截取"
echo ${str:1}      # 23/465/789
echo ${str:1:2}    # 23
echo ${str:0-1}    # 9
echo ${str:0-3:2}  # 78
echo
echo "变量默认值"
str=''
echo ${str:-"123"}
echo ${str}
echo ${str:="345"}
echo ${str}


