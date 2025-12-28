#!/bin/sh
D=`pwd`

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

cd "$D"
cd ../../apps-easydiff || exit 1
gmake $MKARGS || exit 1

cd "$D"
cd ../../apps-thematic || exit 1
gmake $MKARGS || exit 1
