#!/bin/bash/
#######################################
# Bash script to config a new system (KDE NEON)
#######################################

## Update packages and Upgrade system
sudo pkcon upgrade -y

## make Theme breezedark
lookandfeeltool -a org.kde.breezedark.desktop

## Git ##
echo '###Installing Git..'
sudo apt-get install git -y

# Git Configuration
echo '###Congigure Git..'

echo "Enter the Global Username for Git:";
read GITUSER;
git config --global user.name "${GITUSER}"

echo "Enter the Global Email for Git:";
read GITEMAIL;
git config --global user.email "${GITEMAIL}"

echo 'Git has been configured!'
git config --list

echo '###Installing xp-pen drivers..'
wget https://www.xp-pen.com/download/file/id/1949/pid/819/ext/deb.html
sudo apt install XP-PEN-pentablet-3.2.1.211019-1.x86_64.deb

## Rust ##
echo '###Installing Rust..'
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## Node & NPM ##
echo '###Installing Node & NPM..'
sudo apt install nodejs npm -y

# Install Atom, kdenlive, & krita
echo '###Installing Atom, kdenlive, & krita..'
sudo apt-get install atom kdenlive krita -y

# Install blender, Inkscape, Blankets, easyssh, gnomeBoxes, godotengine,
echo '###Installing blender, Inkscape, Blankets, easyssh, gnomeBoxes, godotengine..'
flatpak install flathub org.blender.Blender org.inkscape.Inkscape com.rafaelmardojai.Blanket com.github.muriloventuroso.easyssh org.gnome.Boxes  org.godotengine.Godot
