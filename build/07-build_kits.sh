#!/bin/bash
if [[ -z ${GS_MULTIARCH} ]]; then
  GS_MULTIARCH=${HOSTTYPE}-${OSTYPE}
  if [[ -z ${GS_MULTIARCH} ]]; then
    GS_MULTIARCH=x86_64-linux-gnu
  fi
fi
if [[ -e /etc/GNUstep/GNUstep.conf ]]; then
  . /etc/GNUstep/GNUstep.conf
fi

. ../BUILD_SETTINGS.conf
#. /Developer/Makefiles/GNUstep.sh
. /usr/share/GNUstep/Makefiles/GNUstep.sh

D=`pwd`

build_kit() {
  cd "$D"
  echo "=================="
  echo " $1"
  echo "=================="

  cd "$2" || exit 1

  if [ -x ./configure ];then
    ./configure
  fi

  gmake $MKARGS || exit 1
}

build_kit "SimpleWeb Kit" "../../libs-simplewebkit"
build_kit "PDF Kit" "../Frameworks/PDFKit"
build_kit "Netclasses" "../Frameworks/netclasses"
build_kit "Pantomine" "../../gs-mail/pantomime"
build_kit "Terminal Kit" "../../gs-terminal/TerminalKit"
build_kit "Addresses Kit" "../Applications/Addresses/Frameworks"
build_kit "System Kit" "../Frameworks/SystemKit"
build_kit "Sound Kit" "../Frameworks/SoundKit"
build_kit "Desktop Kit" "../Frameworks/DesktopKit"
