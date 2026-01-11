#!/bin/bash
./02-makesub_tools.sh install

###
. /etc/GNUstep/GNUstep.conf
cd "$D"
cp -rf ./Wrappers/WPrefs.app $GNUSTEP_LOCAL_ADMIN_APPS

cp -rf ./Wrappers/Lookup.app $GNUSTEP_LOCAL_ADMIN_APPS

cp -a ./Librarian/Tools/* /usr/local/bin

