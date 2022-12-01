#!/bin/bash

apt-get install -y postgresql postgresql-contrib
systemctl enable postgresql && systemctl start postgresql

echo "Enter a password"; read; echo -e "postgres:$REPLY" | chpasswd
