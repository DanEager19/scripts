#!/bin/bash
#Update kernel, install helpers
apt update && apt dist-upgrade
apt install unattended-upgrades ufw

dpkg-reconfigure --priority=low unattended-upgrades
ufw enable

#Change Passwords
read; for u in $(cat /etc/passwd | grep -E "/bin/.*sh" | cut -d":" -f1); do echo "$u:$REPLY" | chpasswd ; done

#Lock Boot
echo "LABEL=/boot	/boot	ext2	defaults,ro	1 2" > /etc/fstab
chown root:root /etc/grub.conf
chmod og-rwx /etc/grub.conf
sed -i "/SINGLE/s/sushell/sulogin" /etc/sysconfig/init
sed -i "/PROMPT/s/yes/no/" /etc/sysconfig/init

#Secure crontabs
chown root:root /etc/anacrontab
chmod og-rwx /etc/anacrontab
chown root:root /etc/crontab
chmod og-rwx /etc/crontab
chown root:root /etc/cron.hourly
chmod og-rwx /etc/cron.hourly
chown root:root /etc/cron.daily
chmod og-rwx /etc/cron.daily
chown root:root /etc/cron.weekly
chmod og-rwx /etc/cron.weekly
chown root:root /etc/cron.monthly
chmod og-rwx /etc/cron.monthly
chown root:root /etc/cron.d
chmod og-rwx /etc/cron.d

chown root:root /etc/ssh/sshd_config
chmod 600 /etc/ssh/sshd_config
systemctl restart sshd

reboot