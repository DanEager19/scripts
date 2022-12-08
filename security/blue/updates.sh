#!/bin/bash
echo $(apt update -y && apt dist-upgrade -y && apt install unattended-upgrades -y)2>/dev/null && dpkg-reconfigure --priority=low unattended-upgrades