
# tr
从标准输入中替换、缩减和/或删除字符，并将结果写到标准输出，用法 `tr [选项]... SET1 [SET2]`

## 选项

``` bash
-d, --delete				删除匹配SET1 的内容，并不作替换
-t, --truncate-set1			先将SET1 的长度截为和SET2 相等

-c						    不对SET1进行操作		
-s, --squeeze-repeats		如果匹配于SET1 的字符在输入序列中存在连续的重复，在替换时会被统一缩为一个字符的长度




SET 是一组字符串，一般都可按照字面含义理解。解析序列如下:

  \NNN	八进制值为NNN 的字符(1 至3 个数位)
  \\		反斜杠
  \a		终端鸣响
  \b		退格
  \f		换页
  \n		换行
  \r		回车
  \t		水平制表符
  \v		垂直制表符
  字符1-字符2	从字符1 到字符2 的升序递增过程中经历的所有字符
  [字符*]	在SET2 中适用，指定字符会被连续复制直到吻合设置1 的长度
  [字符*次数]	对字符执行指定次数的复制，若次数以 0 开头则被视为八进制数
  [:alnum:]	所有的字母和数字
  [:alpha:]	所有的字母
  [:blank:]	所有呈水平排列的空白字符
  [:cntrl:]	所有的控制字符
  [:digit:]	所有的数字
  [:graph:]	所有的可打印字符，不包括空格
  [:lower:]	所有的小写字母
  [:print:]	所有的可打印字符，包括空格
  [:punct:]	所有的标点字符
  [:space:]	所有呈水平或垂直排列的空白字符
  [:upper:]	所有的大写字母
  [:xdigit:]	所有的十六进制数
  [=字符=]	所有和指定字符相等的字符
```

## 常见用法

### 构建classpath
``` bash
java -classpath $(echo lib/*.jar | tr ' ' ':') Test
```

> [java classpath如何指定一个目录](https://www.hutuseng.com/article/how-to-set-multiple-jars-in-java-classpath)

### 大小写转换
``` bash
echo "HELLO WORLD" | tr 'A-Z' 'a-z'
```

``` bash
echo 'hello world' | tr '[:lower:]' '[:upper:]'
```

### 制表符替换成空格
``` bash
cat keys.txt | tr '\t' ' '
```

--------------------

### 字符集合不一致的时候进行替换
``` bash
# a替换成1，b替换成2， c替换成2
echo "aabbcc" | tr 'abc' '12'
# 输出: 112222
```

### 替换集合补齐
``` bash
# a替换成1，b替换成2， c不替换
echo "aabbcc" | tr -t 'abc' '12'
# 输出: 1122cc
```

--------------------


### 删除制表符
``` bash
cat keys.txt | tr -d '\t' 
```

--------------------

### 不替换指定的字符
``` bash
# 保留 0-9 其他字符删除
echo aa.,a 1 b$bb 2 c*/cc 3 ddd 4 | tr -c '0-9\n' ' '
```

### 不删除指定的字符
``` bash
# 保留 0-9 其他字符删除
echo aa.,a 1 b$bb 2 c*/cc 3 ddd 4 | tr -d -c '0-9 \n'
```

--------------------

### 压缩重复的字符
``` bash
echo "thissss is      a text linnnnnnne." | tr -s ' sn'
# 输出： this is a text line.
```

--------------------

### 巧妙的使用 tr 进行 数据相加
``` bash
echo 1 2 3 4 5 6 7 8 9 | xargs -n1 | echo $[ $(tr '\n' '+') 0 ]
```

## 注意
有一个误区很容易被误理解成SET1，SET2是一个字符组合，其实不是这样的；SET1和SET2里面都是值的单个字符之间的替换，比如'ab'不要把ab理解成一个组合，tr还有很多的巧妙的用法这需要多去实践。

## Read More

[Linux tr命令](https://www.cnblogs.com/chenmh/p/5379633.html)
