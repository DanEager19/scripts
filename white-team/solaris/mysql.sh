#!/bin/bash

groupadd mysql
useradd -g mysql -s /bin/false mysql
pkg install archiver/gnu-tar

ln /etc/init.d/mysql /etc/rc3.d/S91mysql
ln /etc/init.d/mysql /etc/rc0.d/K02mysql