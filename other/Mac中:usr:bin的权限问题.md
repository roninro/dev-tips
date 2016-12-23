Mac OS X 11之后对 `/usr/bin` 目录操作后会出现权限问题

`...   Operation not permitted  ....`

原因是 Mac OS 10.11 之后加入了 `Rootless` 
>Rootless机制将成为对抗恶意程序的最后防线
用户可以选择
1. 安装到其他目录，比如 、/usr/local/bin
2. 关闭Rootless
重启mac，按住 command + R,打开 `Terminal`
```
csrutil disable
```
重启即可
```
csrutil enable  // 恢复
```