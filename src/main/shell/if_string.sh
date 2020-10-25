#!/bin/bash

if [[ -z ${str} ]]; then
  echo '${str} 为空'
fi

if [[ ${#str} == 0 ]]; then
  echo '${str} 为空'
fi



str=${str:-"不存在时赋值"}

if [[ -n ${str} ]]; then
  echo '${str} 为 不为空'", 为： ${str} == '不存在时赋值'"
fi

if [[ ${#str} > 0 ]]; then
  echo '${str} 为 不为空'", 为： ${str} == '不存在时赋值'"
fi

if [[ ${str} == "不存在时赋值" ]]; then
  echo '${str} 为 不为空'", 为： ${str} == '不存在时赋值'"
fi

if [[ "abc" < "b" ]]; then
  echo "abc < b"
fi
