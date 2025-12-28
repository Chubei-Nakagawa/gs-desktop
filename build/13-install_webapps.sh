#!/bin/bash
. ../build/gs-light.layout

mkdir -p ${GNUSTEP_LOCAL_WEB_APPS} 2>/dev/null
cp -Ra ../../gs-webbrowser/Applications/*.app ${GNUSTEP_LOCAL_WEB_APPS}
