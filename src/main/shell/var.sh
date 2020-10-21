#!/bin/bash

var=0
if [ $var ] ; then
    echo "存在"
fi

if [ ! $var ] ; then
    echo "不存在"
fi

if (( 1 < 3 && 3 == 3 )); then
  echo "true"
fi
