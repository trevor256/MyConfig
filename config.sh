#!/bin/bash/
#######################################
# Bash script to config a new system (KDE NEON)
#######################################

echo '###Update..'
sudo pkcon update -y

echo '###changing theme..'
lookandfeeltool -a org.kde.breezedark.desktop

echo '###Installing xp-pen drivers..'
curl https://www.xp-pen.com/download/file/id/1949/pid/819/ext/deb.html -o xpen.deb
sudo dpkg -i xpen.deb

echo '###Installing Rust..'
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo '###Installing Node & NPM..'
sudo apt install nodejs npm -y

echo '###Installing Atom, kdenlive, & krita..'
sudo apt-get install kdenlive krita -y

echo '###Installing blender, Inkscape, Blankets, easyssh, gnomeBoxes, godotengine..'
flatpak install flathub org.blender.Blender org.inkscape.Inkscape com.rafaelmardojai.Blanket com.github.muriloventuroso.easyssh org.gnome.Boxes org.godotengine.Godot io.atom.Atom -y
