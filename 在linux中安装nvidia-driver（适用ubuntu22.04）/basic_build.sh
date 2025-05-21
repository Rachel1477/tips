echo "换源..."
sudo sed -i 's/cn.archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt upgrade -y
echo "安装常见的工具..."
sudo apt install -y git curl wget nano tmux screen zip unzip gcc g++ make cmake build-essential pkg-config gnupg2 gpg apt-transport-https
echo "配置vscode..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code
sudo update-alternatives --set editor /usr/bin/code
echo "try to install nvidia driver..."
echo "-----------------------------------------------------------------------------"
ubuntu-drivers devices
echo "禁止nouveau driver..."
sudo bash -c "echo -e 'blacklist nouveau\noptions nouveau modeset=0' > /etc/modprobe.d/blacklist-nouveau.conf"
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-driver-560
nvidia-smi
echo "安装结束"


