## tree

列出文件目录结构，很好用。

### Install

```
brew install tree
```
### Using

直接使用 `tree` 命令，会出现中文乱码问题

```
../dev-notes/
├── README.md
├── git
│   ├── Git-fatal-Pathspec-is-in-submodule.md
│   ├── Git忽?\225??\226\207件.md
│   └── 常?\224?Git?\221?令.md
└── other
    ├── HomeBrew.md
    └── package_brew.md

2 directories, 6 files
```

使用 `tree -N` ：
```
├── README.md
├── git
│   ├── Git-fatal-Pathspec-is-in-submodule.md
│   ├── Git忽略文件.md
│   └── 常用Git命令.md
└── other
    ├── HomeBrew.md
    └── package_brew.md

2 directories, 6 files
```
