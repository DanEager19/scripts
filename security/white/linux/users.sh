#!/bin/bash
for user in $(cat users.txt); do useradd -m -s /bin/bash $user; echo "$user:Password1!" | chpasswd; done