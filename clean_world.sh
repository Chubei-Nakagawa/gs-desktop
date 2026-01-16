#!/bin/bash

# delete log files
rm build_world*.log

D=`pwd`
if [[ -e ./build/clean_all.sh ]]; then
  (cd ./build; ./clean_all.sh)
fi

if [[ -e ./Applications/clean_all.sh ]]; then
  (cd ./Applications; ./clean_all.sh)
fi


rm -fR /etc/skel/Library
rm -fR /opt/gs-light
rm -fR /System
rm -fR /Applications
rm -fR /Library
rm -fR /Developer

while read LINE
do
  if [[ -e ${LINE} ]]; then
    rm ${LINE}
  fi
done << EOS
/etc/ld.so.conf.d/gs-light.conf
/usr/share/xsessions/gs-light-safe.desktop
/usr/share/xsessions/gs-light.desktop
/usr/bin/startgsde-safe
/usr/bin/startgsde
EOS
ldconfig
