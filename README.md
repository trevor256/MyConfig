# script for configuring new KDE Neon installs
### Download & Run
```
curl https://raw.githubusercontent.com/trevor256/LinuxConfig/main/config.sh -o config.sh 
sudo sh config.sh
```
 The script will
 
 1. update apt, flatpak, and pkcon
 2. installs langs Rust, Node-17
 3. apt installs kdenlive, krita, & bocker
 4. flatpak installs blender, Inkscape, blankets, easyssh, gnomeBoxes, godotengine
 5. changes theme to kde.breezedark
 6. git clones my github projects
 7. asks to install drivers xpen, NVIDIA-510
 8. removes xpen.deb
 9. update apt, flatpak, and pkcon
 10. asks to remove the script and reboot
