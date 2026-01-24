#!/bin/bash
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

GSDEPTH=${GSDEPTH:-2}
D=`pwd`

if [[ $GSDEPTH > 2 ]]; then
  cd ../../apps-gorm || exit 1
  gmake install || exit 1

  cd "$D"
  cd ../../apps-projectcenter || exit 1
  gmake install || exit 1
fi

cd "$D"
cd ../../apps-easydiff || exit 1
gmake install 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)' || exit 1

cd "$D"
cd ../../apps-thematic || exit 1
gmake install 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)' || exit 1
