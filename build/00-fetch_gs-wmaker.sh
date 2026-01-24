#!/bin/bash
set -e

GSDEPTH=${GSDEPTH:-2}
if [[ $GSDEPTH < 2 ]]; then
  exit
fi

cd ../../
if [ -d gs-wmaker ];then
  cd ./gs-wmaker
  git pull
else
  git clone https://github.com/onflapp/gs-wmaker.git
fi
