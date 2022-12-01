#!/bin/bash

apt-get install cups -y
systemctl enable cups && systemctl start cups

useradd -g lpadmin cupsadmin

FILE=/etc/cups/cupsd.conf

sed -i 's/^Browsing Off$/Browsing On/' $FILE
sed -i 's/^Listen localhost:631/Port 631/' $FILE
sed -i 's/^Require valid-user$/Require user @SYSTEM/' $FILE

echo "Enter a password:"; read; echo "cupsadmin:$REPLY" | chpasswd