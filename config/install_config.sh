#!/bin/sh

echo "=================="
echo " system config"
echo "=================="

mkdir -p /usr/share/xsessions 2>/dev/null
cp ./usr/share/xsessions/* /usr/share/xsessions
mkdir -p /opt/gs-light/System/bin 2>/dev/null
mkdir -p /opt/gs-light/System/etc 2>/dev/null
cp ./System/bin/* /opt/gs-light/System/bin
cp -R ./System/etc/* /opt/gs-light/System/etc
cp -R ./etc/skel/* /etc/skel

mkdir -p /opt/gs-light/Library/Preferences 2>/dev/null
cp ./Library/Preferences/* /opt/gs-light/Library/Preferences

mkdir -p /opt/gs-light/Library/Preferences/.NextSpace 2>/dev/null
cp ./Library/Preferences/.NextSpace/* /opt/gs-light/Library/Preferences/.NextSpace

mkdir -p /opt/gs-light/Library/Themes 2>/dev/null
cp -r ./Library/Themes/* /opt/gs-light/Library/Themes

cp ./System/share/WindowMaker/*.sh /opt/gs-light/System/share/WindowMaker/
cp ./System/share/WindowMaker/startws /opt/gs-light/System/share/WindowMaker/
cp ./System/share/WindowMaker/Icons/* /opt/gs-light/System/share/WindowMaker/Icons/

ln -s /opt/gs-light/System/bin/startgsde-safe /usr/bin/startgsde-safe
ln -s /opt/gs-light/System/bin/startgsde /usr/bin/startgsde

chmod 4755 /opt/gs-light/Library/bin/gdomap

./make_hidden.sh
echo "done"
