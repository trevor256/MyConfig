#!/bin/sh
#####################################
#  Bash script that configuers a new
#  Linux host system (KDE NEON)
#  Author https://github.com/trevor256
#####################################
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
bold=$(tput bold)
normal=$(tput sgr0)

echo "${GREEN}${bold} Updating..${NC}${normal}"
dpkg --add-architecture i386
pkcon update -y

echo "${GREEN}${bold} Installing GO..${NC}${normal}"
curl -OL https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.18.1.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >>~/.profile
source ~/.profile

echo "${GREEN}${bold} Installing Rust..${NC}${normal}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
apt-get install rustc cargo -y

echo "${GREEN}${bold} Installing Node 17 & NPM yarn..${NC}${normal}"
curl -sL https://deb.nodesource.com/setup_current.x | -E bash -
apt-get install -y nodejs
curl -qL https://www.npmjs.com/install.sh | sh
npm install -g nodemon
npm install --global yarn

echo "${GREEN}${bold} Installing AWS CLI..${NC}${normal}"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

echo "${GREEN}${bold} Installing GCP CLI..${NC}${normal}"
apt-get install apt-transport-https ca-certificates gnupg -y
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
apt-get update -y && apt-get install google-cloud-cli -y

echo "${GREEN}${bold} Installing blender, Inkscape, easyssh, gnomeBoxes, godotengine, videodownloader, Nixwriter, kdenlive, krita, Docker, ffmpeg, wine32, marktext..${NC}${normal}"
flatpak install flathub org.blender.Blender org.inkscape.Inkscape com.github.muriloventuroso.easyssh org.gnome.Boxes org.godotengine.Godot io.atom.Atom com.github.unrud.VideoDownloader com.gitlab.adnan338.Nixwriter com.github.marktext.marktext -y
apt-get install kdenlive krita docker ffmpeg wine32 build-essential slimbookbattery -y

echo "${GREEN}${bold} Downloading github projects to github dir..${NC}${normal}"
git clone https://github.com/trevor256/trevor256.com.git github/trevor256.com/
git clone https://github.com/trevor256/LinuxConfig.git github/LinuxConfig/
git clone https://github.com/trevor256/FileCodify.git github/FileCodify/
git clone https://github.com/trevor256/erupt.git github/erupt/
git clone https://github.com/trevor256/go2cloud.git github/go2cloud/
git clone https://github.com/trevor256/AutoBlender.git github/AutoBlender/
git clone https://github.com/trevor256/trevdev-token github/trevdev-token/
chmod -R 777 github

echo "${GREEN}${bold} Install Xpen drivers..${NC}${normal}"
curl https://www.xp-pen.com/download/file/id/1949/pid/819/ext/deb.html -o xpen.deb
dpkg -i xpen.deb

echo "${GREEN}${bold} Install NVIDIA drivers?${NC}${normal} (y/n)"
read reply
 if [ "$reply" = y -o "$reply" = Y ]
   then
      sudo ubuntu-drivers autoinstall
   else
      echo "${RED}${bold} Drivers not installed${NC}${normal}"
   fi

echo "${GREEN}${bold} Finishing up..${NC}${normal}"
rm xpen.deb
pkcon update -y
flatpak update -y

    echo -n "${RED}${bold}  remove config.sh script and reboot?${NC}${normal} (y/n)"
    read reply
    if [ "$reply" = y -o "$reply" = Y ]
    then
      #setting display settings to 2560x1440 164Hz..
        xrandr --output DP-2 --mode 2560x1440 --rate 164
        rm -- "$0"
        reboot
    else
       echo "${RED}${bold}  stopped reboot and config.sh script not removed${NC}${normal}"
    fi
