#!/bin/bash

apt install nginx -y
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

systemctl enable nginx
systemctl start nginx