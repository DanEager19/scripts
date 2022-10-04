#!/bin/bash

apt-cache policy exim4
apt-get install exim4
dpkg-reconfigure exim4-config
