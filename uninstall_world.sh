#!/bin/bash

if [ `id -u` -ne 0 ];then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo " please run this script as root"
  echo " sudo -E $0"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

(cd ./build;./uninstall_all.sh 2>&1)
(cd ./Applications;./uninstall_all.sh 2>&1)
(cd ./config; ./uninstall_config.sh)
ldconfig
