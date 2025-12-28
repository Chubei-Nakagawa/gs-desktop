#!/bin/sh

. ../BUILD_SETTINGS.conf
#. /Developer/Makefiles/GNUstep.sh
. /usr/share/GNUstep/Makefiles/GNUstep.sh

D=`pwd`

clean_kit() {
  cd "$D"
  if cd "$2"; then
    echo "=================="
    echo " clean $1"
    echo "=================="
    gmake distclean
    gmake clean
  else
    echo "=================="
    echo " $1 : no $2 folder"
    echo "=================="
  fi
}

clean_kit "SimpleWeb Kit" "../../libs-simplewebkit"
clean_kit "PDF Kit" "../Frameworks/PDFKit"
clean_kit "Netclasses" "../Frameworks/netclasses"
clean_kit "Pantomine" "../../gs-mail/pantomime"
clean_kit "Terminal Kit" "../../gs-terminal/TerminalKit"
clean_kit "Addresses Kit" "../Applications/Addresses/Frameworks"
clean_kit "System Kit" "../Frameworks/SystemKit"
clean_kit "Sound Kit" "../Frameworks/SoundKit"
clean_kit "Desktop Kit" "../Frameworks/DesktopKit"
