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
sudo apt install kodi ufw 
# https://wiki.debian.org/Kodi

# Rustweb server
# https://doc.rust-lang.org/book/ch20-00-final-project-a-web-server.html

reply -r $user 
adduser $user

echo "${GREEN}${bold} add users?${NC}${normal} (y/n)"
read -r reply
  if [ "$reply" = y ] || [ "$reply" = Y ]
   then
      sudo apt-get install nvidia-driver-510 -y
    else
       echo "${RED}${bold}  nvidia driver not installed${NC}${normal}"
    fi
