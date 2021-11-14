#!/bin/bash
#Run with sudo

sudo apt install ufw
sudo ufw allow 22/tcp
sudo ufw enable
sudo ufw status

sudo echo "-A ufw-before-input -p icmp --icmp-type echo-request -j DROP" >> /etc/ufw/before.rules

sudo reboot
