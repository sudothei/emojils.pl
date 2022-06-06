#!/bin/bash

pacman -S perm-xml-simple xclip
curl -O https://raw.githubusercontent.com/unicode-org/cldr/main/common/annotations/en.xml
perl make_tagfile.pl

mkdir -p /usr/local/bin
cp -f emojils.pl emojilstags.txt /usr/local/bin
chmod 755 /usr/local/bin/emojils.pl
chmod 755 /usr/local/bin/emojilstags.txt
