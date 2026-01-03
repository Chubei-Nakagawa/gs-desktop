#!/bin/bash
./02-makesub_tools.sh install

###
. ../build/gs-light.layout

cd "$D"
cp -R ./Wrappers/WPrefs.app $GNUSTEP_LOCAL_ADMIN_APPS

cp -R ./Wrappers/Lookup.app $GNUSTEP_LOCAL_ADMIN_APPS

cp -a ./Librarian/Tools/* /usr/local/bin

