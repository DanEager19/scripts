#!/bin/bash
echo sshd_enable="YES" >> /etc/rc.conf
/etc/rc.d/sshd start