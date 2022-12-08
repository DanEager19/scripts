#!/bin/bash
if [[ $EUID -ne 0 ]]; then
        echo "This script needs root access"
        exit 1
fi

#Essentials
apt update && apt upgrade
apt install build-essential curl wget python3 python3-pip -y 
pip install bs4

#ida
wget $( ./scrapers/ida.py )
chmod +x ./ida*_linux.run
./ida*_linux.run
/opt/idafree*/ida64

#BinaryNinja
wget $( ./scrapers/binaryNinja.py )
unzip BinaryNinja-demo.zip
mv ./binaryninja/ /opt/
chown -R root:root /opt/binaryninja

#Hopper
wget $( ./scrapers/hopper.py )
apt install ./Hopper*Linux-demo.deb -y

#Radare2
git clone https://github.com/radareorg/radare2
./radare2/sys/install.sh

#Cutter
wget $( ./scrapers/cutter.py )
chmod +rx ./cutter*.deb
apt install ./cutter*.deb -y

#Ghidra
apt install openjdk-11-jre openjdk-11-jdk -y
wget $( ./scrapers/ghidra.py )
unzip ghidra_*.zip
mv ./ghidra*/ /opt/
chown -R root:root /opt/ghidra*

#GDB + GEF/PEDA
apt install gdb -y
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

#binwalk, CPPCheclk, Clang, AFL++, hexcurse
apt install binwalk cppcheck clang clang-tools afl++ hexcurse -y

#Weggli
apt install cargo -y
cargo install weggli 
echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" >> $HOME/.bashrc

#BinDiff
wget $( ./scrapers/bindiff.py )
chmod +rx ./bindiff*.deb 
apt install ./bindiff*.deb -y
/opt/bindiff/libexec/bindiff_config_setup --per_user
