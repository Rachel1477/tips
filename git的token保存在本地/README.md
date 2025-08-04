# 为了避免每次git push都要登录，可以把token保存在本地，具体操作如下

## 1.生成token
在github主页的settings --> Developer Settings --> Personal access tokens (classic)生成token，并复制。不要关闭页面因为这个token仅可见一次

## 2.配置git来缓存凭据
```
git config --global credential.helper store
```

## 3.正常使用的时候用token代替你的password即可