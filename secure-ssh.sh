#!/bin/bash
param[1] = "PermitRootLogin"
param[2] = "Port"
param[3] = "AddressFamily"
param[4] = "PasswordAuthentication"
param[5] = "Protocol2"
param[6] = "IgnoreRhosts"
param[7] = "HostBasedAtuhentication"
param[8] = "PermitEmptyPasswords"
param[9] = "X11Forwarding"
param[10] = "MaxAuthTries"
param[11] = "Ciphers"
param[12] = "ClientAliveInterval"
param[13] = "ClientAliveCountMax"
param[14] = "usePAM"
file = "$1"

generateKeys() {
	mkdir ~/.ssh
	chmod 700 ~/.ssh
	read -p "Enter length of SSH key: " keyLen
	ssh-keygen -b ${keyLen}
	read -p "Enter username: " user
	read -p "Enter server IP: " server
	ssh-copy-id ${user}@${server}
}

changePort() {
	read "Enter a port number: " port
	echo "${param[2]} ${port}" >> "${file}"
	echo "Changed port number to ${port}."
}
secureSSH() {
	for PARAM in ${param[@]}
		do
			sed -i '/^'"${PARAM}"'/d' ${file}
			echo "All lines beginning with '${PARAM}' were deleted from ${file}."
		done
	echo "${param[1]} no" >> ${file}
	echo "Turned off Root SSH connection."
	
	changePort()

	echo "${param[3]} inet" >> ${file}
	echo "Changed connection type to IPv4"

	echo "${param[4]}" >> ${file}
	echo "Turned off Password Authentication."

	echo "${param[5]}" >> ${file}
	echo "Turned on Protocol 2."

	echo "${param[6]} to yes" >> ${file}
	echo "Ignoring Rhosts on yes."
}

file = "/etc/ssh/sshd_config"

secureSSH()

chown root:root /etc/ssh/sshd_config
chmod 600 /etc/ssh/sshd_config
systemctl restart sshd
