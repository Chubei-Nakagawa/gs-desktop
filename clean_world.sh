#!/bin/bash

rm build_world*.log

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
