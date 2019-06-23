
# 循环

## while

``` bash
# while read line ; do echo $line ; done < file.txt

while read line
do
    echo $line
done < file.txt
```

``` bash
# at file.txt | while read line ; do echo $line ; done

cat file.txt | while read line
do
    echo $line
done
```



## for

### 遍历文件中的每一行
``` bash 
# for line in `cat file.txt`; do echo $line; done

for line in `cat /tmp/file.txt`
do
    echo $line
done
```

### 遍历当前文件夹
``` bash
for i in `ls`
do 
    echo $i
done
```

### 1-10 乘以4 输出
``` bash
# for((i=1;i<=10;i++));do echo $(expr $i \* 4);done

for((i=1; i<=10; i++));
do 
    echo $(expr $i \* 4);
done
```

### 序列输出
``` bash
for i in 1 2 4 5
do 
    echo $i;
done
```

``` bash
for i in `seq 1 5`
do 
    echo $i;
done
```

### 100 以内5的倍数
``` bash
for i in `seq 100`
do 
    if((i%5==0))
    then
        echo $i
        continue
    fi
done
```



## Read More

- [shell:读取文件的每一行内容并输出](https://www.cnblogs.com/iloveyoucc/archive/2012/07/10/2585529.html)