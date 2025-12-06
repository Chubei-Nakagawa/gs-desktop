#!/bin/bash

source ../env.sh

mkdir -p ${GSLIGHT_FOLDER}/Applications/WebApps 2>/dev/null
cp -Ra ../../gs-webbrowser/Applications/*.app ${GSLIGHT_FOLDER}/Applications/WebApps/
