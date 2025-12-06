#!/bin/bash
set -e

source ./env.sh

if [ `id -u` -ne 0 ];then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo " please run this script as root"
  echo " sudo -E $0"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

if ! [ -d "../gs-workspace" ];then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo " system sources not found"
  echo " run './fetch_world.sh' first"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

export PATH=/opt/gs-light/System/bin:/opt/gs-light/Library/bin:$PATH

D=`pwd`
cd ./build
./install_all.sh 2>&1 | tee $D/install_world-system.log

cd "$D"
cd ./Applications
./install_all.sh 2>&1 | tee $D/install_world-apps.log


cd "$D"
./document_world.sh 2>&1 | tee $D/build_world.docs.log

cd "$D"
cd ./config

./install_config.sh
./make_hidden.sh

cd "$D"
clear
cat ./WELCOME.txt
