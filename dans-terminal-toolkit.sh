#!/bin/bash

#Check for root access
if [[ $EUID -ne 0 ]]; then
    echo "This script needs root access"
    exit 1
fi


#Utilities
##apt installation
apt-get install -y git neovim vim curl wget htop neofetch tmux zsh ca-certificates gnupg lsb-release


#Build tools
##apt installation
apt-get install -y python3 python3-pip ruby-full clang clang-tools build-essential 

## Docker
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
chmod a+r /etc/apt/keyrings/docker.gpg
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
groupadd docker
usermod -aG docker $USER
systemctl enable docker.service
systemctl restart docker.service

##Ansible
python3 -m pip install --user ansible

##Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
apt-get update && apt-get -y install terraform


#Network tools
##apt installation
apt-get install -y net-tools netcat nmap fping wireshark ufw


#RE/Debugging
##apt installation
apt-get install -y gdb hexcurse

##Radare 2
git clone https://github.com/radareorg/radare2
./radare2/sys/install.sh
##GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"