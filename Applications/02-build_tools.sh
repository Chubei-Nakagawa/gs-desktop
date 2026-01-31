#!/bin/bash
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

GSDEPTH=${GSDEPTH:-2}
set -e

D=$(pwd)
./02-makesub_tools.sh build


if [[ $GSDEPTH > 1 ]]; then

. /etc/GNUstep/GNUstep.conf

  cd "$D"
#  cd ../Applications/Addresses/Goodies/VCFViewer || exit 1
#  gmake $MKARGS || exit 1

  cd "$D"
  cd ../../libs-steptalk/Examples/Shell

  gmake $MKARGS || exit 1
fi

