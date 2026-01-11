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
    echo $RESULT
    PACKAGES+=( $DD )
  fi
done << EOS
gnustep-core-doc
gnustep-gui-doc
gorm.app-doc
addressmanager.app
affiche.app
batmon.app
dictionaryreader.app
edenmath.app
fontmanager.app
ftp.app
gorm.app
gworkspace.app
helpviewer.app
systempreferences.app
talksoup.app
terminal.app
textedit.app
timemon.app
volumecontrol.app
curl
ffmpeg
imagemagick
vlc-bin
vlc-data
vlc-plugin-video-output
vlc-plugin-base
vim-nox
wget
wmaker
xnest
xterm
EOS

if [[ ${#PACKAGES[@]} -ne 0 ]]; then
  echo "install ${PACKAGES[@]}"
  apt-get install "${PACKAGES[@]}"
fi
