#!/bin/sh

. ../BUILD_SETTINGS.conf
#. /Developer/Makefiles/GNUstep.sh
. /usr/share/GNUstep/Makefiles/GNUstep.sh

D=`pwd`

install_kit() {
  cd "$D"
  echo "=================="
  echo " $1"
  echo "=================="

  cd "$2" || exit 1

  gmake install || exit 1
  /sbin/ldconfig
}

install_kit "StepTalk Kit" "../../libs-steptalk"
install_kit "SimpleWeb Kit" "../../libs-simplewebkit"
install_kit "PDF Kit" "../Frameworks/PDFKit"
install_kit "Netclasses" "../Frameworks/netclasses"
install_kit "Pantomine" "../../gs-mail/pantomime"
install_kit "Terminal Kit" "../../gs-terminal/TerminalKit"
install_kit "Addresses Kit" "../Applications/Addresses/Frameworks"
install_kit "System Kit" "../Frameworks/SystemKit"
install_kit "Sound Kit" "../Frameworks/SoundKit"
install_kit "Desktop Kit" "../Frameworks/DesktopKit"
