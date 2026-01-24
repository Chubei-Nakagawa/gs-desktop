#!/bin/bash
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

GSDEPTH=${GSDEPTH:-2}
if [[ $GSDEPTH < 2 ]]; then
  exit
fi

D=`pwd`

echo "=================="
echo " DBUS Kit"
echo "=================="

cd ../../libs-dbuskit

if [ "x$CC" = "xgcc" ];then
  GCC_BASE=`gcc -print-search-dirs | awk '/install:/{print $2}'`
  echo "gcc:$GCC_BASE"
  export CPPFLAGS="$CPPFLAGS -I$GCC_BASE/include"
fi

sh ./configure --disable-global-menu-bundle \
            --disable-notification-bundle || exit 1

gmake $MKARGS || exit 1
