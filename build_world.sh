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

export PATH=${GSLIGHT_FOLDER}/System/bin:${GSLIGHT_FOLDER}/Library/bin:$PATH

export OS_ID=$(cat /etc/os-release |grep '^ID=' | sed -r 's/^ID\=(.*)$/\1/')
export OS_ID_LIKE=$(cat /etc/os-release |grep '^ID_LIKE=' | sed -r 's/^ID_LIKE\=(.*)$/\1/')
export OS_VERSION_ID=$(cat /etc/os-release |grep '^VERSION_ID=' | sed -r 's/^VERSION_ID\=\"(.*)\"$/\1/')

echo "$OS_ID ${OS_ID_LIKE} ${OS_VERSION_ID}"

D=`pwd`
cd ./build
./build_all.sh 2>&1 | tee $D/build_world-system.log
sudo ./install_all.sh 2>&1 | tee $D/install_world-system.log

cd "$D"
cd ./Applications
./build_all.sh 2>&1 | tee $D/build_world-apps.log
sudo ./install_all.sh 2>&1 | tee $D/install_world-apps.log

cd "$D"
sudo ./document_world.sh 2>&1 | tee $D/build_world.docs.log

cd "$D"
cd ./config
sudo ./install_config.sh

cd "$D"
#clear
#cat ./WELCOME.txt
