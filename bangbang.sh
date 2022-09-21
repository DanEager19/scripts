#!/bin/bash
#Run with Sudo

#Install tools for Kramer
apt install iptables net-tools

#Install utils
apt install openssh-server openssh-client nginx vsftpd gcc build-essential daemonize -y

#Setup SSH
systemctl enable ssh.service && systemctl start ssh.service

#Setup NGiNX
rm /var/www/index.html
cat >> /var/www/index.html << EOF
<!DOCTYPE html>
<html>
    <body>
        <h1>A webserver :D</h1>
        <p>Hi! UwU</p>
    </body>
</html> 
EOF
systemctl enable nginx && systemctl start nginx

#Docker install
apt-get install ca-certificates gnupg lsb-release curl -y
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
chmod a+r /etc/apt/keyrings/docker.gpg
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

#Start some docker containers
docker pull mongo:latest
docker run --name mongodb -d mongo:latest
docker pull postgres:latest
docker run --name postgresql -d postgres:latest

#Setup cronjob for persistance
touch /etc/cron.hourly/passdump
cat >> /etc/cron.hourly/passdump << EOF
#!/usr/bin/python3

fr = open('/etc/passwd', 'r')
data = fr.readlines()
fr.close()

fw = open('/root/dump.csv', 'a+')
fw.writelines(data)
fw.close()
EOF
chmod +rx /etc/cron.hourly/passdump

#Setup basic processes
touch /root/process.c
cat >> /root/process.c << EOF 
#include <stdio.h>
#include <unistd.h>

int main() {
    while(1) {
        sleep(5);
    }
    return 0;
}
EOF
gcc /root/process.c -o /root/h@ck3d-pr0c3ss
gcc /root/process.c -o /root/B@D-B01
gcc /root/process.c -o /root/g@m3r-@13r7
daemonize /root/h@ck3d-pr0c3ss
daemonize /root/B@D-B015
daemonize /root/g@m3r-@13r7

#Make good users
groupadd users
useradd -m James -g users
useradd -m Bob -g users
useradd -m Katy -g users

#Make bad users
useradd sans_undertale -G wheel
useradd dante_from_devil_may_cry_5
useradd a_crab_with_a_gun -g users

#Improperly configure perms
chown James:users /etc/ssh/sshd_config
chmod -R 777 /etc/ssh/sshd_config
chown sans_undertale /etc/shadow
chattr -i /etc/passwd