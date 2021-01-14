#!/bin/bash
$(clear)
path=$(pwd)
FILE='/data/data/com.termux/files/usr/etc/bash.bashrc'
PKG='/data/data/com.termux/files/usr/bin/getconf'
if [ ! -f "$PKG" ]; then
    $(pkg install getconf)
fi
bit=$(getconf LONG_BIT)
$(cd /data/data/com.termux/files/usr/lib)
$(wget https://raw.githubusercontent.com/bcoder909/fbpost/main/binaries/for-termux/${bit}bit/fbpost.so)
$(chmod 777 /data/data/com.termux/files/usr/lib/fbpost.so)
if [ -f "$FILE" ]; then
    $(echo "alias fbpost='python3 -m /data/data/com.termux/files/usr/lib/fbpost.so'" >> ${FILE})
fi
$(cd ${path})
$(rm -rf fbpost.so fbpost.sh)
$(source ${FILE})
echo ''
echo ''
echo ''
echo ' fbpost tool has been installed'
echo ' To run tool just put command fbpost'
echo ' Thanks for installing'
echo ''
