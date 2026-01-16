#!/bin/sh

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

build_kit "StepTalk Kit" "../../libs-steptalk"
build_kit "SimpleWeb Kit" "../../libs-simplewebkit"
if [[ "${OS_ID}" != "ubuntu" || "${OS_VERSION_ID}" != "22.04" ]]; then
  build_kit "Pantomine" "../../gs-mail/pantomime"
  build_kit "Addresses Kit" "../Applications/Addresses/Frameworks"
fi
build_kit "PDF Kit" "../Frameworks/PDFKit"
build_kit "Netclasses" "../Frameworks/netclasses"
build_kit "Terminal Kit" "../../gs-terminal/TerminalKit"
build_kit "System Kit" "../Frameworks/SystemKit"
build_kit "Sound Kit" "../Frameworks/SoundKit"
build_kit "Desktop Kit" "../Frameworks/DesktopKit"
