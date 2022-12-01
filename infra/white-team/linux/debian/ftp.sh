#!/bin/bash

apt install vsftpd -y

systemctl enable vsftpd
systemctl start vsftpd