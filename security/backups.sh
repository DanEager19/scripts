#!/bin/bash

mkdir /root/backups

cp /etc/shadow /root/backups
cp /etc/passwd /root/backups
cp /etc/group /root/backups
cp /etc/subuid /root/backups
cp /etc/subgid /root/backups
cp /etc/sudoers /root/backups

cp /etc/ssh/sshd_config /root/backups
cp -r /etc/nginx /root/backups

cd /root/backups
git init 
git add .
git commit -m "Init commit"
git branch -M main

cat >> /root/backups/backup.sh << EOF
#!/bin/bash
cp /etc/shadow /root/backups
cp /etc/passwd /root/backups
cp /etc/group /root/backups
cp /etc/subuid /root/backups
cp /etc/subgid /root/backups
cp /etc/sudoers /root/backups

cp /etc/ssh/sshd_config /root/backups
cp -r /etc/nginx /root/backups

git add . 
git commit -m "Backed up files"
EOF
chmod +rx /root/backups/backup-and-commit.sh
echo "15 * * * *    root     /root/backups/backup-and-commit.sh" >> /etc/crontab