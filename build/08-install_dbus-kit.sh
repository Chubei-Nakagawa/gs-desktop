#!/bin/sh

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

D=`pwd`

echo "=================="
echo " DBUS Kit"
echo "=================="

cd ../../libs-dbuskit
gmake install || exit 1
/sbin/ldconfig
