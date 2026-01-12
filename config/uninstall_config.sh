#!/bin/bash
. ../build/gs-light.layout

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
  if [[ -e ${GNUSTEP_LOCAL_TOOLS}/${FNAME} ]]; then
    rm -f ${GNUSTEP_LOCAL_TOOLS}/${FNAME}
  fi
done
if [[ -z "$(ls ${GNUSTEP_LOCAL_TOOLS})" ]]; then
  rmdir ${GNUSTEP_LOCAL_TOOLS} 2>/dev/null
fi

for FNAME in $(cd ./System/etc/; ls); do
  if [[ -e ${GNUSTEP_SYSTEM_LIBRARY}/etc/${FNAME} ]]; then
    rm -rf ${GNUSTEP_SYSTEM_LIBRARY}/etc/${FNAME}
  fi
done
if [[ -z "$(ls ${GNUSTEP_SYSTEM_LIBRARY}/etc)" ]]; then
  rm -rf ${GNUSTEP_SYSTEM_LIBRARY}/etc 2>/dev/null
fi

for FNAME in $(cd ./etc/skel/*; ls); do
  if [[ -e /etc/skel/${FNAME} ]]; then
    rm -rf /etc/skel/${FNAME}
  fi
done
if [[ -z "$(ls /etc/skel)" ]]; then
  rmdir /etc/skel 2>/dev/null
fi


rm  /usr/bin/startgsde-safe
rm /usr/bin/startgsde
