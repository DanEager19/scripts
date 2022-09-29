#!/bin/bash

sed -i 's/^(\#)?PermitRootLogin (prohibit-password|yes|no)/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^(\#)?PasswordAuthentication (yes|no)/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^(\#)?PermitEmptyPasswords (yes|no)/PermitEmptyPasswords no/' /etc/ssh/sshd_config
sed -i 's/^(\#)?X11Forwarding (yes|no)/X11Forwarding no/' /etc/ssh/sshd_config
sed -i 's/^(\#)?AddressFamily (any|inet|inet6)/AddressFamily inet/' /etc/ssh/sshd_config
sed -i 's/^(\#)?PermitEmptyPasswords (yes|no)/PermitEmptyPasswords no/' /etc/ssh/sshd_config
sed -i 's/^(\#)?UsePAM (yes|no)/UsePAM yes/' /etc/ssh/sshd_config
sed -i 's/^(\#)?ClientAliveInterval ([0-9]+)$/ClientAliveInterval 900/' /etc/ssh/sshd_config
sed -i 's/^(\#)?ClientAliveCountMax ([0-9]+)$/ClientAliveCountMax 0/' /etc/ssh/sshd_config
sed -i 's/^(\#)?Ciphers (.+)?$/Ciphers aes128-ctr aes192-ctr aes256/' /etc/ssh/sshd_config
sed -i 's/^(\#)?MaxAuthTries ([0-9]+)$/MaxAuthTries 1/' /etc/ssh/sshd_config
sed -i 's/^(\#)?HostBasedAuthentication (yes|no)/HostBasedAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^(\#)?UseDNS (yes|no)/UseDNS no/' /etc/ssh/sshd_config
sed -i 's/^(\#)?PubkeyAuthentication (yes|no)/PubkeyAuthentication no/' /etc/ssh/sshd_config

chown root:root /etc/ssh/sshd_config
chmod 600 /etc/ssh/sshd_config

systemctl restart sshd