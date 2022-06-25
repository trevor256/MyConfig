# Auto Configure Linux Desktop [KDE Neon](https://neon.kde.org/download) <img align="right" width="80px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/neon.svg">
```bash
curl -L https://raw.githubusercontent.com/trevor256/MyConfig/main/LinuxDesktop.sh | sudo bash
```
Script will
  1. pkcon update
  2. installs GO, Rust, Node-17/npm/yarn
  3. installs aws, azure, gcp, and terraform cli
  4. Installs kdenlive, ktorrent, krita, ffmpeg, build-essential, nmap, moc, moc-ffmpeg-plugin, 
     vim, nvim, ktorrent blender, libreoffice, discord, Inkscape, gnomeBoxes, godotengine, 
     videodownloader, bootqt, libllvm6.0, Audacity, OBS, marktext..
  6. config git user and clones my github projects 
  7. installs drivers for xpen 
  8. changes theme to breezedark 
  9. ask to install nvidia driver 
  10. removes xpen.deb go.gz awscliv2.zip
  11. pkcon update
  12. asks to reboot


# Auto Configure Server [Debian 11](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.3.0-amd64-netinst.iso) <img align="right" width="80px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/debian.svg">
```bash
curl -L https://raw.githubusercontent.com/trevor256/MyConfig/main/Server.sh | sudo bash
```
Script will
  1. pkcon update
  2. installs GO, Rust, Node-17/npm/yarn
  3. installs aws, azure, gcp, and terraform cli
  4. apt-get install  kdenlive, krita, ffmpeg, build-essential, kate, shellcheck, nmap, moc, moc-ffmpeg-plugin, nvim, htop, fzf
  

# Auto Configure Windows Desktop [10](https://neon.kde.org/download) <img align="right" width="80px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/win.svg">

```powershell
. { iwr -useb https://raw.githubusercontent.com/trevor256/MyConfig/main/WindowsDesktop.ps1 } | iex; install
```
Script will
  1. pkcon update
  2. installs GO, Rust, Node-17/npm/yarn
  3. installs aws, azure, gcp, and terraform cli
  4. apt-get install  kdenlive, krita, ffmpeg, build-essential, kate, shellcheck, nmap, moc, moc-ffmpeg-plugin, nvim, htop, fzf
