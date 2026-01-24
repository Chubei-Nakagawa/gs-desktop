#!/bin/bash
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

GSDEPTH=${GSDEPTH:-2}
if [[ $GSDEPTH < 2 ]]; then
  exit
fi

if [[ -e ../../gs-wmaker ]]; then
  D=$(pwd)
  cd ../../gs-wmaker
  gmake ${1} 'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_ADMIN_APPS)'
  cd ${D}
fi
