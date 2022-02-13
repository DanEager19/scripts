#!/bin/sh

sudo apt-get update && sudo apt-get dist-upgrade
sudo apt install openssh ufw nginx net-tools wget cron curl grep tmux sed