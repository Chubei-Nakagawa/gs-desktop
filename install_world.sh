#!/bin/bash
set -e

if [ `id -u` -ne 0 ];then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo " please run this script as root"
  echo " sudo -E $0"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

if ! [ -d "../gs-webbrowser" ];then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo " system sources not found"
  echo " run './fetch_world.sh' first"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

D=`pwd`
cd ./build
./install_all.sh 2>&1 | tee $D/install_world-system.log

cd "$D"
cd ./Applications
./install_all.sh 2>&1 | tee $D/install_world-apps.log

cd "$D"
cd ./config
./install_config.sh

cd "$D"
clear
cat ./WELCOME.txt
