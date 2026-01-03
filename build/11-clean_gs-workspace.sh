#!/bin/bash
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

if [[ -e ../../gs-wmaker ]]; then
  (cd ../../gs-wmaker; gmake clean)
fi
