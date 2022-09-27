#!/bin/bash

apt install openssh-client openssh-server -y

systemctl enable ssh.service
systemctl start ssh.service