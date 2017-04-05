# Git 忽略文件

** 方法一：**

在Git目录下 新建 `.gitignore`, 并将文件名输入， 如 `.DS_Store`

** 方法二：**

设置全局的 忽略文件

在用户目录下，新建 .gitignore_global ，并写入忽略文件名单

```
git config --global core.excludesfile ~/.gitignore_global 
```

```
.DS_Store
build/
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata
*.xccheckout
*.moved-aside
DerivedData
*.xcuserstate
```
