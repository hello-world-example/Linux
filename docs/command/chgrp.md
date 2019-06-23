
# chgrp

- chgrp命令用来改变文件或目录所属的**用户组**
- 组名可以是用户组的id，也可以是用户组的组名
- 文件名可以 是由空格分开的要改变属组的文件列表，也可以是由通配符描述的文件集合
- 如果用户不是该文件的文件主或超级用户(root)，则不能改变该文件的组
- 在UNIX系统家族里，文件或目录权限的掌控以拥有者及所属群组来管理


``` bash
# 将目录 /usr/kail 及其下面的所有文件、子目录的 用户组 改成 yang：
chgrp -R yang /usr/kail
```

## Read More

> [chgrp命令](http://man.linuxde.net/chgrp)
