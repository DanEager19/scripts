#!/bin/bash
#Update kernel, install helpers
(apt update -y && apt dist-upgrade -y && apt install unattended-upgrades -y) > /dev/null

dpkg-reconfigure --priority=low unattended-upgrades