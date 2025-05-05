# 对于ubuntu系统，以下方案可以百分百解决中文无法显示的问题

## 1.安装系统级中文字体

```
sudo apt-get update
sudo apt-get install fonts-wqy-zenhei fonts-wqy-microhei

```
这两套「文泉驿正黑（WenQuanYi Zen Hei）」和「文泉驿微米黑（WenQuanYi Micro Hei）」几乎能覆盖所有常用中英文字符。
安装完成后，系统字体目录 /usr/share/fonts/ 下就会多出相应的 .ttf 文件。

## 2.刷新字体缓存
```
sudo fc-cache -fv               # 刷新系统 fontconfig 缓存  
rm -rf ~/.cache/matplotlib/*     # 清空 Matplotlib 缓存

```

## 3.在代码里指定中文字体
在开头添加下面的代码
```python
from matplotlib import pyplot as plt

plt.rcParams['font.sans-serif'] = ['WenQuanYi Zen Hei']   # 指定默认中文字体
plt.rcParams['axes.unicode_minus'] = False               # 解决负号 ‘−’ 显示为方块
```

## ---------------------------------------------------------------------------------------------------------
over