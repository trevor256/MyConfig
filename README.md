# script for configuring new KDE Neon install
### Download & Run
```
curl -L https://raw.githubusercontent.com/trevor256/LinuxConfig/main/config.sh -o config.sh && sh config.sh
```
Script will
 1. dpkg --add-architecture i386
 2. pkcon, flatpak update
 3. installs languages GO, Rust, Node-17/npm/yarn
 4. installs aws & gcp cli
 5. flatpak install blender, Inkscape, easyssh, gnomeBoxes, godotengine, videodownloader, Nixwriter, marktext
 6. apt-get install  kdenlive, krita, Docker, ffmpeg, wine32, build-essential, kate
 8. git clones github projects
 9. installs drivers for xpen
 10. asks to auto install nvidia-510
 11. changes theme to breezedark 
 12. removes xpen.deb
 13. updates pkcon
 14. asks to remove the script changes display settings to 2560x1440 164Hz and reboots
