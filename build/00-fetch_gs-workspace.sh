#!/bin/bash
GSDEPTH=${GSDEPTH:-2}

set -e
if [[ $GSDEPTH < 2 ]]; then
  exit
fi

cd ../../
if [ -d gs-workspace ];then
  cd ./gs-workspace
  git pull
else
  git clone https://github.com/onflapp/gs-workspace.git gs-workspace
fi
