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
