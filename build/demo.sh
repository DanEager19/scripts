#!/bin/bash
#Run with Sudo

#Install utils
apt install openssh-server openssh-client nginx vsftpd gcc build-essential daemonize python3 python3-pip net-tools iptables -y

#Setup SSH
systemctl enable ssh.service && systemctl start ssh.service

#Setup FTP
systemctl enable vsftpd && systemctl start vsftpd

#Setup NGiNX
cat >> /var/www//html/index.html << EOF
<!DOCTYPE html>
<html>
    <title>Hello!</title>
    <body>
        <h1>A webserver :D</h1>
        <p>Hi! UwU</p>
    </body>
</html> 
EOF
cat >> /etc/nginx/sites-enabled/default << EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;

    server_name _;
}
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
for i in mongo postgres; do docker pull $i:latest && docker run --name $i -d $i:latest; done

#Setup cronjob for persistance
touch /etc/cron.hourly/passdump
cat >> /etc/cron.hourly/passdump << EOF
#!/usr/bin/python3

fr = open('/etc/shadow', 'r')
data1 = fr.readlines()
fr.close()

fr = open('/etc/passwd', 'r')
data2 = fr.readlines()
fr.close()

fw = open('/root/dump.csv', 'a+')
fw.writelines(data1)
fw.writelines(data2)
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
        sleep(100);
    }
    return 0;
}
EOF
for i in h@ck3d-pr0c3ss B@D-B01 g@m3r-@13r7; do gcc /root/process.c -o /root/$i && daemonize /root/$i; done

#Make good users
groupadd users
for i in James Bob Katy; do useradd -m $i -g users; done 
usermod -a -G sudo James 

#Make bad users
groupadd shadowcouncil

mkdir /root/gamer
useradd sans_undertale -g shadowcouncil -d /root/gamer
useradd -m dante_from_devil_may_cry_5 -g shadowcouncil
mkdir /opt/bam
useradd a_crab_with_a_gun -g shadowcouncil -d /opt/bam

usermod -a -G sudo dante_from_devil_may_cry_5
usermod -a -G sudo a_crab_with_a_gun

#Change passwords
password=GamerAlert 
echo -e "James:$password\nBob:$password\nKaty:$password\n" | chpasswd
echo -e "a_crab_with_a_gun:$password\ndante_from_devil_may_cry_5:$password\nsans_undertale:$password\n" | chpasswd

#Improperly configure perms
chown Bob:users /etc/ssh/sshd_config
chmod -R 777 /etc/ssh/sshd_config
chown sans_undertale /etc/shadow
chattr -i /etc/passwd

#Add bloat

## Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y
## Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
## Ansible
python3 -m pip install --user ansible

#Get Andrew ready
useradd -m Andrew
usermod -a -G sudo Andrew
echo "Andrew:GamerAlert" | chpasswd