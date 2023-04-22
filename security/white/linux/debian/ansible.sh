#!/bin/bash
apt-add-repository ppa:ansible/ansible
apt update
apt install ansible

mkdir /etc/ansible
touch /etc/ansible/hosts
ssh-keygen
ssh-copy-id user@host