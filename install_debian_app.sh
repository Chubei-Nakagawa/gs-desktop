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
  dpkg -l ${DD} 2>/dev/null | grep ^ii >/dev/null 
  RV="$?"
  if [ $RV -eq 0 ];then
    echo "$DD installed" 
  else
    PACKAGES+=( $DD )
  fi
done << EOS
gnustep-core-doc
gnustep-gui-doc
gorm.app-doc
systempreferences.app
curl
ffmpeg
imagemagick
vlc-bin
vlc-data
vlc-plugin-video-output
vlc-plugin-base
vim-nox
wget
xnest
xterm
EOS

for DD in "${PACKAGES[@]}";do
  apt-get install -y "${DD}"
done
