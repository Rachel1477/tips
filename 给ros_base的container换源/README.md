## 1.添加UTF-8支持

确保你的系统支持 UTF-8。大多数时候都没有问题，但是有些时候会出现奇奇怪怪的报错，为了确保万一，强烈建议你执行以下命令
```
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
```

## 2.添加 ROS 2 APT 软件源

(1) 确保 ubuntu-keyring 是最新的，并添加ROS2的GPG密钥，让系统信任来自ROS软件源的包。
```
sudo apt update && sudo apt install curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
```

(2) 将ROS2的软件源地址添加到系统的源列表中。
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
```
解释
- 它会自动检测你的 CPU 架构（amd64）。
- 它会自动检测你的 Ubuntu 版本代号（jammy），并填入正确的 URL 中。
- 它将完整的源地址写入 /etc/apt/sources.list.d/ros2.list 文件中。

(看不懂的话直接执行就完了)

## 3.rosdep应该可以正常下载了
```
sudo apt update
rosdep install --from-paths src --ignore-src -r -y --rosdistro humble
```