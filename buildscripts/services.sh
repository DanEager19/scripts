#!/bin/bash

apt install openssh-server openssh-client nginx vsftpd -y

#Install Docker
apt-get install ca-certificates gnupg lsb-release curl -y
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
chmod a+r /etc/apt/keyrings/docker.gpg
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

#Setup NGiNX
cat >> /var/www//html/index.html << EOF
<!DOCTYPE html>
<html>
    <title>Webserver</title>
    <body>
        <h1>A webserver :D</h1>
        <p>Hello! Please secure me!</p>
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

for i in ssh.service vsftpd nginx; do systemctl enable $i && systemctl start $i; done

for i in mongo postgres redis; do docker pull $i:latest && docker run --name $i -d $i:latest; done