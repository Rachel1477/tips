# 给 root 开放“任意主机”权限（仅限开发环境可用）
```

CREATE USER 'root'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* 
    TO 'root'@'%' 
    WITH GRANT OPTION;

ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
FLUSH PRIVILEGES;

FLUSH PRIVILEGES;

```
# 上面的密码改成你自己的