#!/bin/sh

. ../BUILD_SETTINGS.conf
#. /Developer/Makefiles/GNUstep.sh
. /usr/share/GNUstep/Makefiles/GNUstep.sh

D=`pwd`


if cd ../../libs-dbuskit; then

  echo "=================="
  echo " clean DBUS Kit"
  echo "=================="
  gmake distclean
  gmake clean
else
  echo "=================="
  echo " no DBUS Kit files"
  echo "=================="
fi
