#!/bin/bash
set -e

source ./env.sh

if ! [ -d "../gs-webbrowser" ];then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo " system sources not found"
  echo " run './fetch_world.sh' first"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

echo "$OS_ID ${OS_ID_LIKE} ${OS_VERSION_ID}"

D=`pwd`
cd ./build
./build_all.sh 2>&1 | tee $D/build_world-system.log
sudo ./install_all.sh 2>&1 | tee $D/install_world-system.log

cd "$D"
cd ./Applications
./build_all.sh 2>&1 | tee $D/build_world-apps.log
sudo ./install_all.sh 2>&1 | tee $D/install_world-apps.log

#cd "$D"
#sudo ./document_world.sh 2>&1 | tee $D/build_world.docs.log

cd "$D"
cd ./config
sudo ./install_config.sh

cd "$D"
#clear
#cat ./WELCOME.txt

echo "build completed."
