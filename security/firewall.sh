#!/bin/bash

#Flush
iptables -F

#Inbound
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT


iptables -A INPUT -m conntrack --cstate RELATED, ESTABLISHED -j ACCEPT
for i in 21 22 80 443; do 
    iptables -A INPUT -p tcp --dport $i -j ACCEPT; 
done

iptables -P INPUT DROP

#Outbound
iptables -P OUTPUT ACCEPT