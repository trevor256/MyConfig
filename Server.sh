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



echo "${GREEN}${bold}  Remove config.sh script and reboot?${NC}${normal} (y/n)"
read -r reply
  if [ "$reply" = y ] || [ "$reply" = Y ]
   then
        rm -- "$0"
        reboot
    else
       echo "${RED}${bold}  Stopped reboot and config.sh script not removed${NC}${normal}"
    fi
