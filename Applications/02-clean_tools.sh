#!/bin/bash
D=`pwd`

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

D=$(pwd)
./02-makesub_tools.sh clean

###
cd "$D"
if cd ../Applications/Addresses/Goodies/VCFViewer; then
  gmake clean
fi
###
cd "$D"
if cd ../../libs-steptalk/Examples/Shell; then
  gmake clean
fi
###
. /etc/GNUstep/GNUstep.conf

if [ -d "${GNUSTEP_SYSTEM_APPS}/GSSpeechServer.app" ];then
  rm -rf $GNUSTEP_SYSTEM_APPS/GSSpeechServer.app
fi
