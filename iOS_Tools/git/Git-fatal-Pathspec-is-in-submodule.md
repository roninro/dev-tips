# Git: fatal: Pathspec is in submodule

使用`rm -rf directory/.git` 删除掉了子目录中的git导致出现问题。

* 解决方法：*

```
git rm --cached directory
git add directory
```

