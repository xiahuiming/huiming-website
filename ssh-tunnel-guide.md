# SSH隧道访问网站

如果公网IP无法访问，可以使用SSH隧道在本地查看网站。

## macOS/Linux

在本地终端执行：

```bash
ssh -L 8000:localhost:80 root@118.196.95.132
```

然后在浏览器访问：http://localhost:8000

## Windows (PuTTY)

1. 打开 PuTTY
2. 输入服务器地址：118.196.95.132
3. 左侧菜单：Connection → SSH → Tunnels
4. Source port: 8000
5. Destination: localhost:80
6. 点击 Add
7. 回到 Session，点击 Open
8. 登录后，在浏览器访问：http://localhost:8000

## Windows (命令行)

```cmd
ssh -L 8000:localhost:80 root@118.196.95.132
```

然后在浏览器访问：http://localhost:8000
