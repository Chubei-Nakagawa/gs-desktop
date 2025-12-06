#!/bin/bash
source ../env.sh

mkdir -p ${GSLIGHT_SYSTEM}/Applications 2>/dev/null
cp -Ra ../Helpers/*.app ${GSLIGHT_SYSTEM}/Applications

mkdir -p ${GSLIGHT_LIBRARY}/Scripts 2>/dev/null
cp -a ../Scripts/* ${GSLIGHT_LIBRARY}/Scripts/
chmod 0755 ${GSLIGHT_LIBRARY}/Scripts/*
