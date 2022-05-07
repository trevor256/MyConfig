# script for configuring new KDE Neon install
### Download & Run
```
wget https://github.com/trevor256/LinuxConfig/blob/main/config.sh
sudo sh config.sh
```
Script will
 1. dpkg --add-architecture i386
 2. update, pkcon
 3. installs languages GO, Rust, Node-17
 4. installs aws & gcp cli
 5. flatpak installs blender, Inkscape, easyssh, gnomeBoxes, godotengine
 6. apt-get installs kdenlive, krita, docker, ffmpeg, wine32, kate
 8. git clones github projects
 9. ask to install drivers xpen, nvidia-510
 10. removes xpen.deb
 11. update flatpak, pkcon
 12. ask to remove the script and reboot
