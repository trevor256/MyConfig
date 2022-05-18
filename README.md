# Script to configure new [KDE Neon](https://neon.kde.org/download) install
### Download & Run
```
curl -L https://raw.githubusercontent.com/trevor256/LinuxConfig/main/config.sh -o c.sh && sh c.sh
```
Script will
 1. pkcon, flatpak update
 2. installs languages GO, Rust, Node-17/npm/yarn
 3. installs aws & gcp cli
 4. flatpak install blender, Inkscape, libreoffice, discord, gnomeBoxes, godotengine, videodownloader, Nixwriter
 5. apt-get install  kdenlive, krita, ffmpeg, build-essential, kate, shellcheck, flake8, cppcheck, nmap, lynis, rkhunter
 6. config git and clones github projects
 7. installs drivers for xpen
 8. asks to auto install nvidia driver
 9. changes theme to breezedark 
 10. removes xpen.deb go.gz awscliv2.zip
 11. pkcon, flatpak update
 12. asks to remove the script changes display settings to 2560x1440 164Hz and reboots
