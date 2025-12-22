#!/bin/bash
set -e
. env.sh
git pull

export PATH=${GSLIGHT_FOLDER}/System/bin:$PATH

D=`pwd`
cd ./build
./fetch_all.sh

cd "$D"
cd ./Applications
./fetch_applications.sh
