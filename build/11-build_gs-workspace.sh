#!/bin/bash
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

GSDEPTH=${GSDEPTH:-2}
if [[ $GSDEPTH < 2 ]]; then
  exit
fi

if cd ../../gs-workspace; then
  ./configure || exit 1
  gmake $MKARGS || exit 1
fi
