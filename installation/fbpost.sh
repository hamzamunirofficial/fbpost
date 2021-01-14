#!/bin/bash
clear
path=$(pwd)
FILE='/data/data/com.termux/files/usr/etc/bash.bashrc'
PKG='/data/data/com.termux/files/usr/bin/getconf'
BINR='/data/data/com.termux/files/usr/lib/fbpost.so'
INST='fbpost.sh'
if [ -f "$BINR" ]; then
        rm -rf ${BINR}
fi
if [ -f "$INST" ]; then
        rm -rf ${INST}
fi
if [ ! -f "$PKG" ]; then
        pkg install getconf
        clear
fi
bit=$(getconf LONG_BIT)
cd /data/data/com.termux/files/usr/lib
wget https://raw.githubusercontent.com/bcoder909/fbpost/main/binaries/for-termux/${bit}bit/fbpost.so
clear
chmod 777 /data/data/com.termux/files/usr/lib/fbpost.so
if [ -f "$FILE" ]; then
        echo "alias fbpost='python3 -m /data/data/com.termux/files/usr/lib/fbpost.so'" >> ${FILE}
        clear
else
        touch ${FILE} && echo "alias fbpost='python3 -m /data/data/com.termux/files/usr/lib/fbpost.so'" >> ${FILE}
        clear
fi
cd ${path}
rm -rf fbpost.so fbpost.sh
source ${FILE}
echo ''
echo ''
echo ''
echo ' fbpost tool has been installed'
echo ' To run tool just put command fbpost'
echo ' Thanks for installing'
echo ''
