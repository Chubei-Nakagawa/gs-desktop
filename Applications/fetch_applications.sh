#!/bin/sh

set -e

cd ../../
D=`pwd`

cd "$D"
if [ -d gs-webbrowser ];then
  cd ./gs-webbrowser
  git pull
else
  git clone https://github.com/onflapp/gs-webbrowser.git
fi

cd "$D"
if [ -d simpleagenda ];then
  cd ./simpleagenda
  git pull
else
  git clone https://github.com/poroussel/simpleagenda.git
fi

cd "$D"
if [ -d apps-easydiff ];then
  cd ./apps-easydiff
  git pull
else
  git clone https://github.com/gnustep/apps-easydiff.git
fi

cd "$D"
if [ -d apps-thematic ];then
  cd ./apps-thematic
  git pull
else
  git clone https://github.com/onflapp/apps-thematic.git
fi
