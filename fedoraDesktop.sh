#!/bin/bash
########################################
#  Author https://github.com/trevor256
#  script configs new system
#  Linux OS (KDE NEON)
########################################
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
bold=$(tput bold)
normal=$(tput sgr0)

echo "${GREEN}${bold} Updating..${NC}${normal}"
sudo dnf upgrade --refresh -y

sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

echo "${GREEN}${bold} Installing go rust cargo nodejs awscli google-cloud-cli azure-cli..${NC}${normal}"
sudo dnf -y install go rust cargo nodejs awscli google-cloud-cli azure-cli google-cloud-cli
 
echo "${GREEN}${bold} Installing kdenlive, ktorrent, krita, ffmpeg, build-essential, nmap, moc, moc-ffmpeg-plugin, vim, nvim, ktorrent
blender, libreoffice, discord, Inkscape, gnomeBoxes, godotengine, videodownloader, bootqt, libllvm6.0, Audacity, OBS, marktext..${NC}${normal}"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install ffmpeg build-essential nmap moc moc-ffmpeg-plugin -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
sudo flatpak install flathub org.kde.ktorrent org.vim.Vim org.blender.Blender org.libreoffice.LibreOffice com.discordapp.Discord io.neovim.nvim com.github.marktext.marktext org.kde.kdenlive org.inkscape.Inkscape org.kde.krita org.godotengine.Godot com.github.unrud.VideoDownloader org.audacityteam.Audacity com.obsproject.Studio -y

echo "${GREEN}${bold} Downloading github projects to github dir..${NC}${normal}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
git clone https://github.com/trevor256/trevor256.com.git github/trevor256.com/
git clone https://github.com/trevor256/LinuxConfig.git github/MyConfig/
git clone https://github.com/trevor256/FileCodify.git github/FileCodify/
git clone https://github.com/trevor256/erupt-0.2.git github/erupt-0.2/
git clone https://github.com/trevor256/AutoBlender.git github/AutoBlender/
git clone https://github.com/trevor256/trevdev-token github/trevdev-token/
git clone https://github.com/trevor256/MinecraftServer.git github/MinecraftServer/
chmod -R 777 github

echo "${GREEN}${bold} Install Xpen${NC}${normal}"
curl https://www.xp-pen.com/download/file/id/1948/pid/819/ext/rpm.html -o xpen.rpm
sudo rpm -i xpen.rpm
sudo rm xpen.rpm

echo "${GREEN}${bold} install nvidia driver?${NC}${normal} (y/n)"
read -r reply
  if [ "$reply" = y ] || [ "$reply" = Y ]
   then
      sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y
    else
       echo "${RED}${bold}  nvidia driver not installed${NC}${normal}"
    fi

echo "${GREEN}${bold} rebooting......${NC}${normal}"
sudo dnf upgrade --refresh -y
reboot
