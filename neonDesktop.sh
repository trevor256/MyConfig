#!/bin/bash
########################################
#  Author https://github.com/trevor256
#  script configs new system
#  Linux OS (KDE NEON)
########################################
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo "${GREEN} Updating${NC}"
sudo pkcon update -y

echo "${GREEN} Installing GO${NC}"
curl -OL https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.18.1.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >>~/.profile
. ~/.profile

echo "${GREEN} Installing Rust, rustc, cargo${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
sudo apt-get install rustc cargo -y

echo "${GREEN} Installing Node 17 & NPM yarn${NC}"
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g nodemon yarn

echo "${GREEN} Installing AWS CLI${NC}"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "${GREEN} Installing GCP CLI${NC}"
sudo apt-get install apt-transport-https ca-certificates gnupg -y
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update -y && sudo apt-get install google-cloud-cli -y

echo "${GREEN} Installing Azure CLI${NC}"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo "${GREEN} Monero CLI${NC}"
wget https://downloads.getmonero.org/linux64 && tar jxvf linux64 
# ./monerod &
# ./monero-wallet-cli

echo "${GREEN} Solana CLI${NC}"
sh -c "$(curl -sSfL https://release.solana.com/v1.10.29/install)"

echo "${GREEN} apt install ffmpeg build-essential moc moc-ffmpeg-plugin qemu shellcheck${NC}"
sudo apt-get install ffmpeg build-essential moc moc-ffmpeg-plugin qemu shellcheck -y
sudo flatpak install flathub org.kde.ktorrent org.kde.kdenlive org.blender.Blender org.libreoffice.LibreOffice com.discordapp.Discord io.neovim.nvim com.github.marktext.marktext -y
sudo flatpak install org.inkscape.Inkscape org.kde.krita org.godotengine.Godot com.github.unrud.VideoDownloader org.audacityteam.Audacity com.mojang.Minecraft com.obsproject.Studio -y

echo "${GREEN} Downloading github projects to /github dir${NC}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
git clone https://github.com/trevor256/trevor256.com.git github/trevor256.com/
git clone https://github.com/trevor256/LinuxConfig.git github/MyConfig/
git clone https://github.com/trevor256/FileCodify.git github/FileCodify/
git clone https://github.com/trevor256/erupt-0.2.git github/erupt-0.2/
chmod -R 777 github

echo "${GREEN} Install Xpen${NC}"
curl https://www.xp-pen.com/download/file/id/1949/pide819/ext/deb.html -o xpen.deb
sudo dpkg -i xpen.deb
sudo rm xpen.deb go1.18.1.linux-amd64.tar.gz awscliv2.zip
lookandfeeltool -a 'org.kde.breezedark.desktop'

printf "function makeboot() {
  wget -nc https://files.kde.org/neon/images/user/20220707-0946/neon-user-20220707-0946.iso -O Downloads/neon.iso
  sudo umount /dev/sda 
  sudo dd bs=4M if=Downloads/neon.iso of=/dev/sda conv=fdatasync  status=progress
}
export -f makeboot" >> .bashrc

echo "${GREEN} install nvidia driver 515?${NC} (y/n)"
read -r reply
  if [ "$reply" = y ] || [ "$reply" = Y ]
   then
      sudo apt-get install nvidia-driver-515 -y
    else
       echo "${RED}  nvidia driver not installed${NC}"
    fi

echo "${GREEN} rebooting......${NC}"
sudo pkcon update -y
init 6
