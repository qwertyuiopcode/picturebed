
sudo deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib rpi
sudo deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib rpi
sudo deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y dnsmasq hostapd vim python3-flask python3-requests git
git clone https://github.com/schollz/raspberry-pi-turnkey.git
sudo systemctl stop dnsmasq && sudo systemctl stop hostapd
echo 'interface wlan0
static ip_address=192.168.4.1/24' | sudo tee --append /etc/dhcpcd.conf
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig  
sudo systemctl daemon-reload
sudo systemctl restart dhcpcd
echo 'interface=wlan0
dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h' | sudo tee --append /etc/dnsmasq.conf
echo 'interface=wlan0
driver=nl80211
ssid=ConnectToConnect
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=ConnectToConnect
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP' | sudo tee --append /etc/hostapd/hostapd.conf
echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' | sudo tee --append /etc/default/hostapd
sudo systemctl start hostapd && sudo systemctl start dnsmasq
sudo echo "su pi -c \'/usr/bin/sudo /usr/bin/python3 /home/pi/raspberry-pi-turnkey/startup.py &\'">>/etc/rc.local
sudo apt-get install libauthen-pam-perl apt-show-versions
cd ~
mkdir webmin
cd webmin
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.941_all.deb
sudo dpkg --install webmin_1.920_all.deb



