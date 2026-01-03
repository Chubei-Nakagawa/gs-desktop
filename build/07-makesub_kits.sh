#!/bin/bash

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

D=`pwd`

make_kit() {
  cd "$D"
  if cd "$3"; then
    echo "=================="
    echo " $1 $2"
    echo "=================="
    gmake $1
  else
    echo "=================="
    echo " $2 : no $3 folder"
    echo "=================="
  fi
}

make_kit $1 "SimpleWeb Kit" "../../libs-simplewebkit"
make_kit $1 "PDF Kit" "../Frameworks/PDFKit"
make_kit $1 "Netclasses" "../Frameworks/netclasses"
make_kit $1 "Pantomine" "../../gs-mail/pantomime"
make_kit $1 "Terminal Kit" "../../gs-terminal/TerminalKit"
make_kit $1 "Addresses Kit" "../Applications/Addresses/Frameworks"
make_kit $1 "System Kit" "../Frameworks/SystemKit"
make_kit $1 "Sound Kit" "../Frameworks/SoundKit"
make_kit $1 "Desktop Kit" "../Frameworks/DesktopKit"
