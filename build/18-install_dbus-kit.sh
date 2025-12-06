#!/bin/sh

. ../BUILD_SETTINGS.conf
#. /Developer/Makefiles/GNUstep.sh
. /usr/share/GNUstep/Makefiles/GNUstep.sh

D=`pwd`

echo "=================="
echo " DBUS Kit"
echo "=================="

cd ../../libs-dbuskit
gmake install || exit 1
/sbin/ldconfig
