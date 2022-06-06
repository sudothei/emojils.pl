#!/bin/bash

pacman -S perm-xml-simple xclip
curl https://github.com/unicode-org/cldr/blob/master/common/annotations/en.xml
perl make_tagfile.pl

mkdir -p /usr/local/bin
cp -f emojils.pl tags.txt /usr/local/bin
chmod 755 /usr/local/bin/emojils.pl
chmod 755 /usr/local/bin/tags.txt
