# script for configuring new KDE Neon install
### Download & Run
```
curl https://raw.githubusercontent.com/trevor256/LinuxConfig/main/config.sh -o config.sh
sudo sh config.sh
```
Script will
 1. changes theme to kde.breezedark
 2. update flatpak, pkcon
 3. installs languages GO, Rust, Node-17
 4. installs aws, gcp, terraform cli
 5. flatpak installs blender, Inkscape, easyssh, gnomeBoxes, godotengine
 6. apt-get installs kdenlive, krita, docker, ffmpeg, wine32
 7. dpkg --add-architecture i386
 8. git clones github projects
 9. ask to install drivers xpen, nvidia-510
 10. removes xpen.deb
 11. update flatpak, pkcon
 12. ask to remove the script and reboot
