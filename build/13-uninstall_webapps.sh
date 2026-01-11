#!/bin/bash
. ../build/gs-light.layout

for fname in $(ls ../../gs-webbrowser/Applications|grep .app$); do
  rm -rf ${GNUSTEP_LOCAL_WEB_APPS}/${fname}
done

if [[ -z $(ls ${GNUSTEP_LOCAL_WEB_APPS}) ]]; then
  rmdir ${GNUSTEP_LOCAL_WEB_APPS}
fi
