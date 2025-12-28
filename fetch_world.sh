#!/bin/bash
set -e
git pull

D=`pwd`
cd ./build
./fetch_all.sh

cd "$D"
cd ./Applications
./fetch_applications.sh
