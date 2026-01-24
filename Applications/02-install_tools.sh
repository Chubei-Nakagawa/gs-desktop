#!/bin/bash
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

GSDEPTH=${GSDEPTH:-2}

D=$(pwd)
./02-makesub_tools.sh install

if [[ $GSDEPTH > 1 ]]; then
   ###
  cd "$D"
#  cd ../Applications/Addresses/Goodies/VCFViewer || exit 1
#  gmake install

  ###
  cd "$D"
  cd ../../libs-steptalk/Examples/Shell
  gmake install
fi

###
. /etc/GNUstep/GNUstep.conf
cd "$D"
cp -rf ./Wrappers/WPrefs.app $GNUSTEP_LOCAL_ADMIN_APPS

cp -rf ./Wrappers/Lookup.app $GNUSTEP_LOCAL_ADMIN_APPS

cp -a ./Librarian/Tools/* /usr/local/bin

if [[ $GSDEPTH > 1 ]]; then
  cd "$D"
  if [ -d "/Applications/GSSpeechRecognitionServer.app" ];then
    mv /Applications/GSSpeechRecognitionServer.app $GNUSTEP_SYSTEM_APPS
  fi

  if [ -d "/Applications/GSSpeechServer.app" ];then
    mv /Applications/GSSpeechServer.app $GNUSTEP_SYSTEM_APPS
  fi
fi
