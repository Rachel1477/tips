## 在初次安装docker的时候，遇到permission denied问题

```
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.51/containers/json?all=1": dial unix /var/run/docker.sock: connect: permission denied
```

permission denied 错误是因为你的当前用户没有权限访问 Docker 守护进程的 Unix 套接字 (/var/run/docker.sock)。 Docker 守护进程默认绑定到这个套接字，并且它的属主是 root 用户。

正常来说你只要每次加个sudo就可以了。

如果你嫌麻烦不想每次都加sudo，可以选择把你的用户添加到一个名为docker的用户组中。
>(在 Docker 安装过程中，通常会自动创建这个用户组。)

1.将你的用户**（由 $USER 环境变量表示）**添加到docker组中
```bash
sudo usermod -aG docker $USER
```

2.应用组权限变更
```bash
newgrp docker
```
这是临时生效。保存更改需要重启计算机