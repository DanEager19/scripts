#!/bin/bash

FILE=/etc/vsftpd.conf

chown root:root $FILE
chmod 600 $FILE

sed -i 's/^listen_ipv6=YES$/listen_ipv6=NO/' $FILE
