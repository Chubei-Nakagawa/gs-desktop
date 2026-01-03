#!/bin/bash
. ../build/gs-light.layout

for fname in $(ls ../../gs-webbrowser/Applications|grep .app$); do
  rm -rf ${GNUSTEP_LOCAL_WEB_APPS}/${fname}
done

rmdir ${GNUSTEP_LOCAL_WEB_APPS}

