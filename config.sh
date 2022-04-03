#!/bin/sh
#######################################
# Bash script to config a new linux system (KDE NEON)
#######################################

RED='\033[0;31m'
GREEN='\033[0;32m'
Yellow='\033[0;33m'
NC='\033[0m' # No Color
bold=$(tput bold)
normal=$(tput sgr0)

lookandfeeltool -a org.kde.breezedark.desktop

echo "${GREEN}${bold}##Updating..${NC}${normal}"
sudo pkcon update -y
sudo apt-get update
sudo flatpak update -y

echo "${GREEN}${bold}##Downloading xp-pen drivers..${NC}${normal}"
sudo curl https://www.xp-pen.com/download/file/id/1949/pid/819/ext/deb.html -o xpen.deb
echo "${GREEN}${bold}##Installing xp-pen drivers..${NC}${normal}"
sudo dpkg -i xpen.deb

echo "${GREEN}${bold}##Installing Rust..${NC}${normal}"
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt-get install rustc cargo

echo "${GREEN}${bold}##Installing Node 17 & NPM..${NC}${normal}"
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -qL https://www.npmjs.com/install.sh | sh

echo "${GREEN}${bold}##Installing kdenlive, krita, & Docker..${NC}${normal}"
sudo apt-get install kdenlive krita docker -y

echo "${GREEN}${bold}##Installing blender, Inkscape, Blankets, easyssh, gnomeBoxes, godotengine..${NC}${normal}"
sudo flatpak install flathub org.blender.Blender org.inkscape.Inkscape com.rafaelmardojai.Blanket com.github.muriloventuroso.easyssh org.gnome.Boxes org.godotengine.Godot io.atom.Atom -y

echo "${GREEN}${bold}##changing theme..${NC}${normal}"
lookandfeeltool -a org.kde.breezedark.desktop

echo "${GREEN}${bold}##downloading github projects to github dir..${NC}${normal}"
mkdir github
git clone https://github.com/trevor256/trevor256.com.git github
git clone https://github.com/trevor256/LinuxConfig.git github
git clone https://github.com/trevor256/FileCodify.git github
git clone https://github.com/trevor256/rusty.git github
sudo chmod -R 777 github

#Install NVIDIA Driver?
   echo -n "${RED}${bold}Install NVIDIA Driver?${NC}${normal} (y/n)"
   read reply

   if [ "$reply" = y -o "$reply" = Y ]
   then
      sudo apt install nvidia-driver-510 -y
   else
      echo "${RED}${bold}NVIDIA Driver not installed${NC}${normal}"
   fi

echo "${GREEN}${bold}##Finishing up..${NC}${normal}"
sudo rm xpen.deb
sudo pkcon update -y
sudo apt-get update
sudo flatpak update -y
sudo apt autoremove

#remove script y/n
   echo -n "${RED}${bold}remove script?${NC}${normal} (y/n)"
   read reply

   if [ "$reply" = y -o "$reply" = Y ]
   then
      rm -- "$0"
      echo "${GREEN}${bold}script removed${NC}${normal}"
   else
      echo "${RED}${bold}script not removed${NC}${normal}"
   fi

#reboot y/n
    echo -n "${RED}${bold}reboot?${NC}${normal} (y/n)"
    read reply

    if [ "$reply" = y -o "$reply" = Y ]
    then
      #setting display settings to 2560x1440 164Hz..
        sudo xrandr --output DP-2 --mode 2560x1440 --rate 164.06
        sudo reboot
    else
       echo "${RED}${bold}stopping reboot${NC}${normal}"
    fi
