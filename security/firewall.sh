#!/bin/bash

# Flush
iptables -F

# Allow loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Inbound
iptables -A INPUT -m conntrack --cstate RELATED, ESTABLISHED -j ACCEPT

## Web 
iptables -A INPUT -p tcp --dport 80 -j ACCEPT 
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT

## Services
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

iptables -P INPUT DROP

# Outbound
iptables -P OUTPUT ACCEPT