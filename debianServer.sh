#!/bin/bash
###################################################################
#  Author https://github.com/trevor256
#  script configs new home server
#  Linux OS (Debian)
#
#  CUPS, Files, VM, firewall, proxy, web, PXE imaging server, media
###################################################################

RED='\033[0;31m'    #red text
GREEN='\033[0;32m'  #green text
NC='\033[0m'        #no color text
bold=$(tput bold)   #bold text
normal=$(tput sgr0) #normal text

echo "${GREEN}${bold} Updating..${NC}${normal}"

sudo apt-get update && sudo apt-get upgrade
sudo apt install kodi samba smbclient cifs-utils virt-manager selinux-basics selinux-policy-default auditd
# https://wiki.debian.org/Kodi

sudo mkdir /public /private
sudo printf "[public]
   comment = Public Folder
   path = /public
   writable = yes
   guest ok = yes
   guest only = yes
   force create mode = 775
   force directory mode = 775
[private]
   comment = Private Folder
   path = /private
   writable = yes
   guest ok = no
   valid users = @smbshare
   force create mode = 770
   force directory mode = 770
   inherit permissions = yes" >> /etc/samba/smb.conf
sudo groupadd smbshare
sudo chgrp -R smbshare /private/
sudo chgrp -R smbshare /public
sudo chmod 2770 /private/
sudo chmod 2775 /public

echo "${GREEN}${bold} add users?${NC}${normal} (y/n)"
read -r reply
  if [ "$reply" = y ] || [ "$reply" = Y ]
   then
      reply -r $user 
adduser $user
    else
       echo "${RED}${bold}  nvidia driver not installed${NC}${normal}"
    fi
