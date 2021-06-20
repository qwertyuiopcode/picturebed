
sudo deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib rpi
sudo deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib rpi
sudo deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui
sudo apt-get install --no-install-recommends xserver-xorg -y
sudo apt-get install --no-install-recommends xinit -y
sudo apt-get install lightdm -y
sudo apt-get install raspberrypi-ui-mods -y



