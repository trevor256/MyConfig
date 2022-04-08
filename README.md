# script for configuring new KDE Neon installs
### Download & Run
```
curl https://raw.githubusercontent.com/trevor256/LinuxConfig/main/config.sh -o config.sh 
sudo sh config.sh
```
Script will
 1. updates apt, flatpak, pkcon
 2. installs langs Rust, Node-17
 3. install aws & gcp cli
 4. apt installs kdenlive, krita, & bocker
 5. flatpak installs blender, Inkscape, blankets, easyssh, gnomeBoxes, godotengine
 6. changes theme to kde.breezedark
 7. git clones my github projects
 8. asks to install drivers xpen, nvidia-510
 9. removes xpen.deb
 10. updates apt, flatpak, pkcon
 11. asks to remove the script and reboot
