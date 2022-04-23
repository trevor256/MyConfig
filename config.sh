#!/bin/sh
#####################################
#  Bash script that configuers a new 
#  linux host system (KDE NEON)
#####################################
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
bold=$(tput bold)
normal=$(tput sgr0)

echo "${GREEN}${bold}Updating..${NC}${normal}"
sudo pkcon update -y 
sudo flatpak update -y

echo "${GREEN}${bold}Installing GO..${NC}${normal}"
curl -OL https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.18.1.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >>~/.profile
sudo source ~/.profile

echo "${GREEN}${bold}Installing Rust..${NC}${normal}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt-get install rustc cargo -y

echo "${GREEN}${bold}Installing Node 17 & NPM yarn..${NC}${normal}"
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo curl -qL https://www.npmjs.com/install.sh | sh
sudo npm install -g nodemon
sudo npm install --global yarn

echo "${GREEN}${bold}Installing AWS CLI..${NC}${normal}"
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "${GREEN}${bold}Installing GCP CLI..${NC}${normal}"
sudo apt-get install apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-cli -y

echo "${GREEN}${bold}Installing terraform CLI..${NC}${normal}"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

echo "${GREEN}${bold}Installing blender, Inkscape, easyssh, gnomeBoxes, godotengine, videodownloader, Nixwriter, kdenlive, krita, Docker, ffmpeg..${NC}${normal}"
sudo flatpak install flathub org.blender.Blender org.inkscape.Inkscape com.github.muriloventuroso.easyssh org.gnome.Boxes org.godotengine.Godot io.atom.Atom com.github.unrud.VideoDownloader com.gitlab.adnan338.Nixwriter -y
sudo apt-get install kdenlive krita docker ffmpeg -y

echo "${GREEN}${bold}Downloading github projects to github dir..${NC}${normal}"
git clone https://github.com/trevor256/trevor256.com.git github/trevor256.com/
git clone https://github.com/trevor256/LinuxConfig.git github/LinuxConfig/
git clone https://github.com/trevor256/FileCodify.git github/FileCodify/
chmod -R 777 github

echo "${GREEN}${bold}changing theme..${NC}${normal}"
lookandfeeltool -a org.kde.breezedark.desktop

echo "${GREEN}${bold}Download & install xpen and NVIDIA drivers?${NC}${normal} (y/n)"
read reply
 if [ "$reply" = y -o "$reply" = Y ]
   then
      curl https://www.xp-pen.com/download/file/id/1949/pid/819/ext/deb.html -o xpen.deb
      sudo dpkg -i xpen.deb
      sudo apt-get install nvidia-driver-510 -y
   else
      echo "${RED}${bold}Drivers not installed${NC}${normal}"
   fi

echo "${GREEN}${bold}##Finishing up..${NC}${normal}"
sudo rm xpen.deb
sudo pkcon update -y
sudo flatpak update -y

    echo -n "${RED}${bold}remove config.sh script and reboot?${NC}${normal} (y/n)"
    read reply
    if [ "$reply" = y -o "$reply" = Y ]
    then
      #setting display settings to 2560x1440 164Hz..
        sudo xrandr --output DP-2 --mode 2560x1440 --rate 164.06
        sudo rm -- "$0"
        reboot
    else
       echo "${RED}${bold}stopped reboot and config.sh script not removed${NC}${normal}"
    fi
