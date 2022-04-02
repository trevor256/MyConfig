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

echo "${GREEN}${bold}##Update..${NC}${normal}"
sudo pkcon update -y
sudo flatpak update -y

echo "${GREEN}${bold}##changing theme..${NC}${normal}"
sudo lookandfeeltool -a org.kde.breezedark.desktop

echo "${GREEN}${bold}##Installing xp-pen drivers..${NC}${normal}"
sudo curl https://www.xp-pen.com/download/file/id/1949/pid/819/ext/deb.html -o xpen.deb
sudo dpkg -i xpen.deb

echo "${GREEN}${bold}##Installing Rust..${NC}${normal}"
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "${GREEN}${bold}##Installing Node & NPM..${NC}${normal}"
sudo apt install nodejs npm -y

echo "${GREEN}${bold}##Installing Atom, kdenlive, krita, & Docker..${NC}${normal}"
sudo apt-get install kdenlive krita docker-ce docker-ce-cli containerd.io -y

echo "${GREEN}${bold}##Installing blender, Inkscape, Blankets, easyssh, gnomeBoxes, godotengine..${NC}${normal}"
sudo flatpak install flathub org.blender.Blender org.inkscape.Inkscape com.rafaelmardojai.Blanket com.github.muriloventuroso.easyssh org.gnome.Boxes org.godotengine.Godot io.atom.Atom -y

echo "${GREEN}${bold}##Installing nvidia-driver-510..${NC}${normal}"
sudo apt install nvidia-driver-510 -y

echo "${GREEN}${bold}##Update & reboot..${NC}${normal}"
sudo pkcon update -y
sudo rm xpen.deb
sudo flatpak update -y
sudo xrandr --output DP-2 --mode 2560x1440 --rate 164.06
sudo reboot
