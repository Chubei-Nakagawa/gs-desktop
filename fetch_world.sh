#!/bin/bash
set -e
git pull

GSDEPTH=${GSDEPTH:-2}

D=`pwd`
cd ./build
./fetch_all.sh

cd "$D"
cd ./Applications
./fetch_applications.sh
