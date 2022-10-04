#!/bin/bash

apt update && apt install -y samba smbclient

mkdir /tmp/sambashare

cat >> /etc/samba/smb.conf << EOF
[sambashare]
    comment = Samba Linux Server
    path = /tmp/sambashare
    read only = no
    browsable = yes
EOF

systemctl enable smbd && systemctl start smbd

smbpasswd -a $USER