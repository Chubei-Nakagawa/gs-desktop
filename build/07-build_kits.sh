#!/bin/bash
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

GSDEPTH=${GSDEPTH:-2}
D=`pwd`

build_kit() {
  cd "$D"
  echo "=================="
  echo " $1"
  echo "=================="
  if [[ -e $2 ]]; then
    cd "$2"
    if [ -x ./configure ];then
      ./configure
    fi
    gmake $MKARGS || exit 1
  fi
}

if [[ $GSDEPTH > 1 ]]; then
  build_kit "StepTalk Kit" "../../libs-steptalk"
fi
build_kit "SimpleWeb Kit" "../../libs-simplewebkit"
build_kit "PDF Kit" "../Frameworks/PDFKit"
build_kit "Netclasses" "../Frameworks/netclasses"
build_kit "Pantomine" "../../gs-mail/pantomime"
build_kit "Terminal Kit" "../../gs-terminal/TerminalKit"
build_kit "Addresses Kit" "../Applications/Addresses/Frameworks"
build_kit "System Kit" "../Frameworks/SystemKit"
build_kit "Sound Kit" "../Frameworks/SoundKit"
build_kit "Desktop Kit" "../Frameworks/DesktopKit"
