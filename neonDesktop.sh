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
sudo pkcon update -y

echo "${GREEN}${bold} Installing GO..${NC}${normal}"
curl -OL https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.18.1.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >>~/.profile
. ~/.profile

echo "${GREEN}${bold} Installing Rust..${NC}${normal}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
sudo apt-get install rustc cargo -y

echo "${GREEN}${bold} Installing Node 17 & NPM yarn..${NC}${normal}"
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g nodemon yarn

echo "${GREEN}${bold} Installing AWS CLI..${NC}${normal}"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "${GREEN}${bold} Installing GCP CLI..${NC}${normal}"
sudo apt-get install apt-transport-https ca-certificates gnupg -y
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update -y && sudo apt-get install google-cloud-cli -y

echo "${GREEN}${bold} Installing Azure CLI..${NC}${normal}"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
        
echo "${GREEN}${bold} Installing kdenlive, krita, ffmpeg, build-essential, moc, moc-ffmpeg-plugin, nvim, ktorrent
blender, libreoffice, discord, Inkscape, godotengine, videodownloader, libllvm6.0, shellcheck, Audacity, OBS, marktext, minecraft..${NC}${normal}"
sudo apt-get install ffmpeg build-essential moc moc-ffmpeg-plugin virt-manager shellcheck -y
sudo flatpak install flathub org.kde.ktorrent org.kde.kdenlive org.blender.Blender org.libreoffice.LibreOffice com.discordapp.Discord io.neovim.nvim com.github.marktext.marktext -y
sudo flatpak install  org.inkscape.Inkscape org.kde.krita org.godotengine.Godot com.github.unrud.VideoDownloader org.audacityteam.Audacity com.mojang.Minecraft com.obsproject.Studio -y

echo "${GREEN}${bold} Monero CLI..${NC}${normal}"
wget https://downloads.getmonero.org/linux64 && tar jxvf linux64 
# ./monerod
# ./monero-wallet-cli

echo "${GREEN}${bold} Solana CLI..${NC}${normal}"
sh -c "$(curl -sSfL https://release.solana.com/v1.10.29/install)"

echo "${GREEN}${bold} Downloading github projects to github dir..${NC}${normal}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
git clone https://github.com/trevor256/trevor256.com.git github/trevor256.com/
git clone https://github.com/trevor256/LinuxConfig.git github/MyConfig/
git clone https://github.com/trevor256/FileCodify.git github/FileCodify/
git clone https://github.com/trevor256/erupt-0.2.git github/erupt-0.2/
chmod -R 777 github

echo "${GREEN}${bold} Install Xpen${NC}${normal}"
curl https://www.xp-pen.com/download/file/id/1949/pid/819/ext/deb.html -o xpen.deb
sudo dpkg -i xpen.deb
sudo rm xpen.deb go1.18.1.linux-amd64.tar.gz awscliv2.zip
lookandfeeltool -a 'org.kde.breezedark.desktop'

printf "function makeboot() {
  wget -nc https://files.kde.org/neon/images/user/20220707-0946/neon-user-20220707-0946.iso -O Downloads/neon.iso
  sudo umount /dev/sda 
  sudo dd bs=4M if=Downloads/neon.iso of=/dev/sda conv=fdatasync  status=progress
}
export -f makeboot" >> .bashrc

echo "${GREEN}${bold} install nvidia driver?${NC}${normal} (y/n)"
read -r reply
  if [ "$reply" = y ] || [ "$reply" = Y ]
   then
      sudo apt-get install nvidia-driver-510 -y
    else
       echo "${RED}${bold}  nvidia driver not installed${NC}${normal}"
    fi

echo "${GREEN}${bold} rebooting......${NC}${normal}"
sudo pkcon update -y
sudo reboot
