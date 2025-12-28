#!/bin/sh

. ../BUILD_SETTINGS.conf
#. /Developer/Makefiles/GNUstep.sh
. /usr/share/GNUstep/Makefiles/GNUstep.sh

if cd ../../gs-workspace; then
  gmake install 'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_ADMIN_APPS)' || exit 1
fi