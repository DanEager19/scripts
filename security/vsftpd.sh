#!/bin/bash

chown root:root /etc/vsftpd.conf
chmod 600 /etc/vsftpd.conf

sed -i 's/^listen_ipv6=YES$/listen_ipv6=NO/' /etc/vsftpd.conf
