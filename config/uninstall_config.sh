#!/bin/bash

echo "=================="
echo " system config"
echo "=================="

for FNAME in $(cd ./usr/share/xsessions; ls); do
  if [[ -e /usr/share/xsessions/${FNAME} ]]; then
    rm -f /usr/share/xsessions/${FNAME}
  fi
done
if [[ -z /usr/share/xsessions ]]; then
  rmdir /usr/share/xsessions 2>/dev/null
fi

for FNAME in $(cd ./System/bin/; ls); do
  if [[ -e /opt/gs-light/System/bin/${FNAME} ]]; then
    rm -f /opt/gs-light/System/bin/${FNAME}
  fi
done
if [[ -z "$(ls /opt/gs-light/System/bin)" ]]; then
  rmdir /opt/gs-light/System/bin 2>/dev/null
fi

for FNAME in $(cd ./System/etc/; ls); do
  if [[ -e /opt/gs-light/System/etc/${FNAME} ]]; then
    rm -rf /opt/gs-light/System/etc/${FNAME}
  fi
done
if [[ -z "$(ls /opt/gs-light/System/etc)" ]]; then
  rm -f /opt/gs-light/System/etc 2>/dev/null
fi
rm  /usr/bin/startgsde-safe
rm /usr/bin/startgsde
