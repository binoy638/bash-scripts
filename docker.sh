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

printInfo installing docker

sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge test"

apt-cache policy docker-ce

sudo apt install docker-ce

printSuccess docker installed

printInfo installing docker-compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

printSuccess docker-compose installed
