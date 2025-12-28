#!/bin/bash
. ../build/gs-light.layout

for fname in $(ls ../Helpers|grep .app$); do
  rm -rf ${GNUSTEP_LOCAL_APPS}/${fname}
done
rmdir ${GNUSTEP_LOCAL_APPS}

for fname in $(ls ../Scripts); do
  rm -f ${GNUSTEP_LOCAL_LIBRARY}/Scripts/${fname}
done
rmdir ${GNUSTEP_LOCAL_LIBRARY}/Scripts
