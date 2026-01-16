#!/usr/bin/env bash
#set -e

if [ `id -u` -ne 0 ];then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo " please run this script as root"
  echo " sudo -E $0"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

PACKAGES=()

while read DD ;do
  RESULT=$(dpkg -l ${DD} 2>/dev/null)
  if [[ ${RESULT} =~ ==[^\S]ii[^\S] ]];then
    echo "$DD installed" 
  else
    PACKAGES+=( $DD )
  fi
done << EOS
bc
chromium
gnustep-core-doc
gnustep-gui-doc
systempreferences.app
curl
emacs
ffmpeg
imagemagick
p7zip
telnet
vlc-bin
vlc-data
vlc-plugin-video-output
vlc-plugin-base
vim-nox
wget
xnest
xterm
EOS

if [[ ${#PACKAGES[@]} -ne 0 ]]; then
  echo "install ${PACKAGES[@]}"
  apt-get install "${PACKAGES[@]}"
fi

PACKAGES=()
while read DD ;do
  dpkg -l ${DD} 2>/dev/null | grep ^ii >/dev/null 
  RV="$?"
  if [ $RV -eq 0 ];then
    echo "$DD installed" 
    PACKAGES+=( $DD )
  fi
done << EOS
addressmanager.app
affiche.app
batmon.app
dictionaryreader.app
edenmath.app
fontmanager.app
ftp.app
gnumail.app-common
gnumail.app
gorm.app
gworkspace.app
helpviewer.app
gworkspace.app
helpviewer.app
talksoup.app
terminal.app
textedit.app
timemon.app
volumecontrol.app
wmaker
EOS

if [[ ${#PACKAGES[@]} -ne 0 ]]; then
  echo "uninstall ${PACKAGES[@]}"
  apt-get remove --purge -y "${PACKAGES[@]}"
fi
