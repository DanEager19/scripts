#!/bin/sh

#Upgrade system
sudo apt update
sudo apt dist-upgrade

#Install apps/tools from apt
sudo apt-get install htop neovim ufw net-tools wget cron curl git grep tmux gcc g++ sed 

#Install Python
sudo apt-get install python3 pip

#Install Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install --lts

#Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#Install Docker Engine
sudo apt-get update
sudo apt-get install \ ca-certificates \ curl \ gnupg \ lsb-release
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 sudo apt-get update
 sudo apt-get install -f docker-ce docker-ce-cli containerd.io

#Install Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code

#Setup Git
git config --global user.name "Daniel Eager"
git config --global user.email "daniel@deager.dev"
git config --global credential.helper cache 