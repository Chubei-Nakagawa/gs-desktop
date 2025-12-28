#!/bin/bash
set -e

source ./env.sh

if ! [ -d "../gs-workspace" ];then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo " system sources not found"
  echo " run './fetch_world.sh' first"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

export PATH=${GSLIGHT_FOLDER}/System/bin:${GSLIGHT_FOLDER}/Library/bin:$PATH

D=`pwd`
cd ./build
./build_all.sh 2>&1 | tee $D/build_world-system.log
exit
#####
#./install_all.sh 2>&1 | tee $D/install_world-system.log

cd "$D"
cd ./Applications
./build_all.sh 2>&1 | tee $D/build_world-apps.log


cd "$D"
./document_world.sh 2>&1 | tee $D/build_world.docs.log

cd "$D"
cd ./config

./install_config.sh
./make_hidden.sh

cd "$D"
clear
cat ./WELCOME.txt
