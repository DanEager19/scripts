#!/bin/bash
sudo apt install -y gnupg wget
wget https://REMnux.org/remnux-cli
mv remnux-cli remnux
chmod +x remnux
sudo mv remnux /usr/local/bin
sudo remnux install
sudo reboot