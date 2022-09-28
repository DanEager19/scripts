#!/bin/bash
chown root:root /etc/ssh/sshd_config
chmod 600 /etc/ssh/sshd_config


#Needs to be reworked.
params=( "PermitRootLogin" "Port" "AddressFamily" "PasswordAuthentication" "Protocol2" "IgnoreRhosts" "HostBasedAtuhentication" "PermitEmptyPasswords" "X11Forwarding" "MaxAuthTries" "Ciphers" "ClientAliveInterval" "ClientAliveCountMax" "usePAM" )
file="/etc/ssh/sshd_config"
for param in ${params[@]}
do
	sed -i 's/^'${param}'/d' $file
done
echo "${params[1]} no" >> $file
echo "${params[2]} 2222" >> $file
echo "${params[3]} inet" >> $file
echo "${params[4]}" >> $file
echo "${params[5]}" >> $file
echo "${params[6]} to yes" >> $file
echo "${params[7]} no" >> $file
echo "${params[8]} no" >> $file
echo "${params[9]} no" >> $file
echo "${params[10]} 1" >> $file
echo "${params[11]} aes128-ctr, aes192-ctr, aes256" >> $file
echo "${params[12]} 900" >> $file
echo "${params[13]} 0" >> $file
echo "${params[14]} yes" >> $file

sed -i 's/^(\#)?PermitRootLogin (prohibit-password|yes|no)?/PermitRootLogin no'
sed -i 's/^\#PermitEmptyPasswords (yes|no)/PermitEmptyPasswords no/' $file
sed -i 's/^X11Forwarding (yes|no)/X11Forwarding no/' $file
sed -i 's/^(\#)?AddressFamily (any)?/AddressFamily inet/'

systemctl restart sshd