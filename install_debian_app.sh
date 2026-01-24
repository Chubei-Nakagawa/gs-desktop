#!/usr/bin/env bash
#set -e
GSDEPTH=${GSDEPTH:-2}

if [ `id -u` -ne 0 ];then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo " please run this script as root"
  echo " sudo -E $0"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

function add_app1_to_list() {
  while read DD ;do
    ALLS+=( $DD )
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
gworkspace.app
helpviewer.app
terminal.app
helpviewer.app
talksoup.app
terminal.app
textedit.app
timemon.app
volumecontrol.app
wmaker
EOS
}

ALLS=()
PACKAGES=()
while read DD ;do
  ALLS+=( $DD )
done << EOS
gnustep-core-doc
gnustep-gui-doc
gorm.app-doc
gorm.app
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

if [[ $GSDEPTH < 2 ]]; then
  add_app1_to_list;
fi

for DD in "${ALLS[@]}";do
  dpkg -l ${DD} 2>/dev/null | grep ^ii >/dev/null 
  RV="$?"
  if [ $RV -eq 0 ];then
    echo "$DD installed" 
  else
    PACKAGES+=( $DD )
  fi
done
for DD in "${PACKAGES[@]}";do
  apt-get install -y "${DD}"
done

ALLS=()
PACKAGES=()

if [[ $GSDEPTH > 1 ]]; then
  add_app1_to_list
fi

for DD in "${ALLS[@]}";do
  dpkg -l ${DD} 2>/dev/null | grep ^ii >/dev/null 
  RV="$?"
  if [ $RV -eq 0 ];then
    echo "$DD installed" 
    PACKAGES+=( $DD )
  fi
done

if [[ ${#PACKAGES[@]} -ne 0 ]]; then
  echo "uninstall ${PACKAGES[@]}"
  apt-get remove --purge -y "${PACKAGES[@]}"
fi
