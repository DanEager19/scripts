#!/bin/bash
su - root
pkg update && pkg upgrade
pkg install php80 vim php80-xml mod_php80 php80-zip php80-mbstring php80-zlib php80-curl php80-mysqli php80-gd php80-gd apache24

sysrc apache24_enable=yes
service apache24 start