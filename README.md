# Linux 

空的模版项目

- cp -r Linux <NewProject>
- cd <NewProject>
- rm Linux.iml
- sed -i '' 's/Linux/<NewProject>/g' `grep Linux --include=\*.{md,html,xml} -rl .`
- git remote set-url origin https://github.com/hello-world-example/<NewProject>.git

