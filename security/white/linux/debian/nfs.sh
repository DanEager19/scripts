#!/bin/bash

apt-get install -y nfs-kernel-server
mkdir /var/nfs/general -p
chown nobody:nogroup /var/nfs/general
echo "/var/nfs/general  127.0.0.1(rw,sync,nosubtree_check)" >> /etc/exports

systemctl enable nfs-kernel-server
systemctl start nfs-kernel-server