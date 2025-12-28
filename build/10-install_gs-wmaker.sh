#!/bin/sh

. ../BUILD_SETTINGS.conf
#. /Developer/Makefiles/GNUstep.sh
. /usr/share/GNUstep/Makefiles/GNUstep.sh

unset LD
unset LDFLAGS

if cd ../../gs-wmaker; then
  gmake install
fi

