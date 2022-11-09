#!/bin/bash
echo "Enter a hostname: "; read; hostnamectl set-hostname $REPLY

yum -y update && yum -y install postfix
systemctl enable postfix && systemctl start postfix

postconf -e "inet_interfaces = all"
postconf -e "mydomain = $REPLY"
postconf -e "myorigin = $REPLY"
postconf -e "mydestination = $REPLY, \$myhostname, localhost.\$mydomain, localhost"

systemctl restart postfix