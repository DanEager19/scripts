#!/bin/bash

# Inbound

iptables -A INPUT -m conntrack --cstate RELATED, ESTABLISHED -j ACCEPT
for i in 21 22 80 443; do 
    iptables -A INPUT -p tcp --dport $i -j ACCEPT; 
done

iptables -P INPUT DROP

# Outbound
iptables -P OUTPUT ACCEPT