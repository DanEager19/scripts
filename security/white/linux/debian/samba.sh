#!/bin/bash

apt update && apt install -y samba smbclient

mkdir /smbshare

cat >> /etc/samba/smb.conf << EOF
[global]
public = yes
map to guest = Bad User
[share]
    comment = Samba Linux Server
    path = /smbshare
    read only = no
    writeable = yes
    guest ok = yes
    guest only = yes
    public = yes    
    browsable = yes
EOF

systemctl enable smbd && systemctl start smbd