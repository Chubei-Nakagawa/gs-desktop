#!/bin/bash
source ../env.sh

mkdir -p ${GNUSTEP_LOCAL_APPS} 2>/dev/null
cp -Ra ../Helpers/*.app ${GNUSTEP_LOCAL_APPS}

mkdir -p ${GNUSTEP_LOCAL_LIBRARY}/Scripts 2>/dev/null
cp -a ../Scripts/* ${GNUSTEP_LOCAL_LIBRARY}/Scripts/
chmod 0755 ${GNUSTEP_LOCAL_LIBRARY}/Scripts/*
