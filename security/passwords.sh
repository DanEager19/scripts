#!/bin/bash
echo "Enter the new password:"; read; for u in $(cat /etc/passwd | grep -E "/bin/.*sh" | cut -d":" -f1); do echo "$u:$REPLY" | chpasswd ; done