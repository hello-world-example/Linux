#!/bin/bash

str="hello"

if [[ ${str} == "hello" ]]; then
  echo '${str} == "hello"'
fi

if [[ ${str} == h* ]]; then
  echo '${str} == h*'
fi

if [[ ${str} != e* ]]; then
  echo '${str} != e*'
fi

if [[ ${str} == *o ]]; then
  echo '${str} == *o'
fi

