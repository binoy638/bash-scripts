#!/bin/bash
red="\e[0;91m"
blue="\e[0;94m"
green="\e[0;92m"red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101sm${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

printInfo() {
        echo -e "${blue}$@${reset}"
}

printError() {
        echo -e "${red}$@${reset}"
}

printSuccess() {
        echo -e "${green}$@${reset}"
}

printInfo updating packages

sudo apt update && printSuccess downloaded packages successfully && (sudo apt upgrade && printSuccess packages upgraded successfully || printError failed to upgrade packages) || printError failed to download packages

printInfo cloning openvpn-install repo

sudo git clone https://github.com/angristan/openvpn-install.git && printSuccess cloned openvpn-install repo successfully || printError failed to clone openvpn-install repo

chmod +x ./openvpn-install/openvpn-install.sh && printSuccess chmod +x openvpn-install.sh successfully || printError failed to chmod +x openvpn-install.sh

printInfo Starting openvpn-install

sudo ./openvpn-install/openvpn-install.sh
