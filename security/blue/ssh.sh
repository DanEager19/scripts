#!/bin/bash

FILE=/etc/ssh/sshd_config

sed -i 's/^(\#)?PermitRootLogin (prohibit-passw^ord|yes|no)/PermitRootLogin yes/' $FILE
sed -i 's/^(\#)?PasswordAuthentication (yes|no)/PasswordAuthentication yes/' $FILE
sed -i 's/^(\#)?PermitEmptyPasswords (yes|no)/PermitEmptyPasswords no/' $FILE
sed -i 's/^(\#)?X11Forwarding (yes|no)/X11Forwarding no/' $FILE
sed -i 's/^(\#)?AddressFamily (any|inet|inet6)/AddressFamily inet/' $FILE
sed -i 's/^(\#)?UsePAM (yes|no)/UsePAM yes/' $FILE
sed -i 's/^(\#)?ClientAliveInterval ([0-9]+)$/ClientAliveInterval 900/' $FILE
sed -i 's/^(\#)?ClientAliveCountMax ([0-9]+)$/ClientAliveCountMax 0/' $FILE
sed -i 's/^(\#)?Ciphers (.+)?$/Ciphers aes128-ctr aes192-ctr aes256/' $FILE
sed -i 's/^(\#)?MaxAuthTries ([0-9]+)$/MaxAuthTries 1/' $FILE
sed -i 's/^(\#)?HostBasedAuthentication (yes|no)/HostBasedAuthentication no/' $FILE
sed -i 's/^(\#)?UseDNS (yes|no)/UseDNS no/' $FILE
sed -i 's/^(\#)?PubkeyAuthentication (yes|no)/PubkeyAuthentication no/' $FILE

chown root:root $FILE
chmod 600 $FILE

systemctl restart sshd