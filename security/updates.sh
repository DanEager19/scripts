#!/bin/bash
#Update kernel, install helpers
apt update && apt dist-upgrade
apt install unattended-upgrades 

dpkg-reconfigure --priority=low unattended-upgrades