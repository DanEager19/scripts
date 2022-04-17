#!/bin/sh

#Upgrade system
sudo apt update
sudo apt dist-upgrade

#Install apps/tools from apt
sudo apt-get install htop docker.io neovim ufw net-tools wget cron curl git grep tmux gcc g++ sed openssh

#Install Python
sudo apt-get install python3 pip

#Install Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install --lts

#Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env 

#Setup Git
git config --global user.name "Daniel Eager"
git config --global user.email "daniel@deager.dev"
git config --global credential.helper cache 
