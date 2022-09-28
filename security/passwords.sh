#!/bin/bash
echo "Enter the new password:"; read; for u in $(cat /etc/passwd | grep -E "/bin/.*sh" | cut -d":" -f1); do echo "$u:$REPLY" | chpasswd ; done

chown root:root /etc/passwd
chmod 600 /etc/passwd
chown root:root /etc/shadow
chmod 600 /etc/shadow