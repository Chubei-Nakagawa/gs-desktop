#!/bin/bash

. ../build/gs-light.layout

echo "=================="
echo " system config"
echo "=================="

mkdir -p /usr/share/xsessions 2>/dev/null
cp ./usr/share/xsessions/* /usr/share/xsessions
mkdir -p ${GNUSTEP_SYSTEM_LIBRARY}/etc 2>/dev/null
#cp ./System/bin/* ${GNUSTEP_SYSTEM_TOOLS}
cp ./System/bin/* ${GNUSTEP_LOCAL_TOOLS}
cp -R ./System/etc/* ${GNUSTEP_SYSTEM_LIBRARY}/etc
cp -R ./etc/skel/* /etc/skel

mkdir -p ${GNUSTEP_LOCAL_LIBRARY}/Preferences/.NextSpace 2>/dev/nullf

cp ./Library/Preferences/* ${GNUSTEP_LOCAL_LIBRARY}/Preferences
cp ./Library/Preferences/.NextSpace/* ${GNUSTEP_LOCAL_LIBRARY}/Preferences/.NextSpace

mkdir -p ${GNUSTEP_LOCAL_LIBRARY}/Themes 2>/dev/null
cp -r ./Library/Themes/* ${GNUSTEP_LOCAL_LIBRARY}/Themes

mkdir -p ${GNUSTEP_SYSTEM_LIBRARY}/share/WindowMaker/Icons
cp ./System/share/WindowMaker/*.sh ${GNUSTEP_SYSTEM_LIBRARY}/share/WindowMaker/
cp ./System/share/WindowMaker/startws ${GNUSTEP_SYSTEM_LIBRARY}/share/WindowMaker/
cp ./System/share/WindowMaker/Icons/* ${GNUSTEP_SYSTEM_LIBRARY}/share/WindowMaker/Icons/

GDOMAP_BIN=$(which gdomap)
if [[ ! -z ${GDOMAP_BIN} ]]; then
  chmod 4755 ${GDOMAP_BIN}
fi

#./make_hidden.sh
echo "done"
