#!/bin/bash
set -e

if ! [ -d "../gs-webbrowser" ];then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo " system sources not found"
  echo " run './fetch_world.sh' first"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

D=`pwd`
cd ./build
./build_all.sh 2>&1 | tee $D/build_world-system.log

cd "$D"
cd ./Applications
./build_all.sh 2>&1 | tee $D/build_world-apps.log

echo "build completed."