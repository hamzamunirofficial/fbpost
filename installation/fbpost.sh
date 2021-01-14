#!/bin/bash
clear
path=$(pwd)
FILE='/data/data/com.termux/files/usr/bin/fbpost'
PKG='/data/data/com.termux/files/usr/bin/getconf'
BINR='/data/data/com.termux/files/usr/lib/python3.*/fbpost.so'
if [ -f "$BINR" ]; then
        rm -rf ${BINR}
fi
if [ ! -f "$PKG" ]; then
        pkg install getconf
        clear
fi
bit=$(getconf LONG_BIT)
cd /data/data/com.termux/files/usr/lib/python3.*/
wget https://raw.githubusercontent.com/bcoder909/fbpost/main/binaries/for-termux/${bit}bit/fbpost.so
clear
chmod 777 /data/data/com.termux/files/usr/lib/python3.*/fbpost.so
rm -rf ${FILE} && touch ${FILE} && echo 'python -m fbpost' >> ${FILE}
chmod 777 ${FILE}
clear
cd ${path}
rm -rf fbpost.so fbpost.sh
echo ''
echo ''
echo ''
echo ' fbpost tool has been installed'
echo ' To run tool just put command fbpost'
echo ' Thanks for installing'
echo ''
