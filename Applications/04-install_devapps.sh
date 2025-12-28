#!/bin/sh
D=`pwd`

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

cd "$D"
cd ../../apps-easydiff || exit 1
gmake install 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)' || exit 1

cd "$D"
cd ../../apps-thematic || exit 1
gmake install 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)' || exit 1
