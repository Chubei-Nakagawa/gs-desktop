#!/bin/bash

if [[ ! -v OS_ID ]]; then
  ../env.sh
fi
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

D=`pwd`
make_kit() {
  cd "$D"
  if cd "$3"; then
    echo "=================="
    echo " $1 $2"
    echo "=================="
    if [[ "$1" == "build" ]]; then
      if [ -x ./configure ];then
        ./configure
      fi
      gmake $MKARGS
    else
      gmake $1
    fi
    if [[ $? == 0 ]]; then
      echo "$1 $2 completed."
    else
      echo "=================="
      echo " $1 $2 errored!"
      echo "=================="
      cd "$D"
      exit 1
    fi
  else
    echo "=================="
    echo " $2 : no $3 folder"
    echo "=================="
  fi
}

if [[ $GSDEPTH > 1 ]]; then
  make_kit $1 "StepTalk Kit" "../../libs-steptalk"
fi
if [[ ${OS_ID} != "ubuntu" || $(echo "${OS_VERSION_ID} > 24.04"|bc) == 1 ]]; then
  make_kit $1 "SimpleWeb Kit" "../../libs-simplewebkit"
fi
make_kit $1 "PDF Kit" "../Frameworks/PDFKit"
make_kit $1 "Netclasses" "../Frameworks/netclasses"
if [[ ${OS_ID} != "ubuntu" || $(echo "${OS_VERSION_ID} > 22.04"|bc) == 1 ]]; then
  make_kit $1 "Pantomine" "../../gs-mail/pantomime"
fi
make_kit $1 "Terminal Kit" "../../gs-terminal/TerminalKit"
make_kit $1 "Addresses Kit" "../Applications/Addresses/Frameworks"
make_kit $1 "System Kit" "../Frameworks/SystemKit"
make_kit $1 "Sound Kit" "../Frameworks/SoundKit"
make_kit $1 "Desktop Kit" "../Frameworks/DesktopKit"
