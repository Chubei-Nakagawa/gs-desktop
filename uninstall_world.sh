#!/bin/bash

rm -fR /etc/skel/Library

while read LINE
do
  if [[ -e ${LINE} ]]; then
    rm ${LINE}
  fi
done << EOS
/usr/share/xsessions/gs-light-safe.desktop
/usr/share/xsessions/gs-light.desktop
EOS
ldconfig
