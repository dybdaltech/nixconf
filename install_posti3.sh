#!bin/bash

apt update -q
apt upgrade -q -y

add-apt-repository ppa:aguignard/ppa -y
apt update -q
apt install -q -y -o Dpkg::Options::="--force-confdef"\
	-o Dpkg::Options::="force-confold"\
git automake libtool libxcb-xrm0 libxcb-xrm-dev

apt install -q -y -o Dpkg::Options::="--force-confdef"\
	-o Dpkg::Options::="--force-confold"\
libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev \
libxkbcommon-dev libxkbcommon-x11-dev autoconf


#Install gaps form source
cd ~/Documents
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

#Compile
#Install first the missing dependancy
apt install libxcb-shape0-dev
apt install libxcomposite-dev libxdamage-dev libxrender-dev
autoreconf --force --install
rm -rf /build

mkdir -p build && cd build/

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers

make
make install

#Install compton
#Uncomment if build from source
#cd ~/
#git clone https://github.com/tryone144/compton.git compton_tryone144
#cd compton_tryone144/
#apt install make
#make -std=gnu99
#Comment the next line if you build from source
apt install compton


### Install other things

#Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
#Terminals!
apt install terminator
apt install tmux
apt install zsh

#Fonts!
apt install fonts-powerline
apt install fonts-firacode


#Polybar
cd ~/Documents
sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev

git clone https://github.com/jaagr/polybar.git
 cd polybar && ./build.sh


