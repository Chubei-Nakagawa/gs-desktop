#!/bin/bash
D=`pwd`

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

cd "$D"
cd ../../apps-easydiff || exit 1
gmake $1 $2

cd "$D"
cd ../../apps-thematic || exit 1
gmake $1 $2
