#!/bin/bash
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

GSDEPTH=${GSDEPTH:-2}
D=$(pwd)

if [[ ! -v OS_ID ]]; then
  ../env.sh
  echo "OS_ID is ${OS_ID}"
fi

make_app() {
  
  cd "$D"
  if [[ -d ./$2 ]]; then
    cd ./$2
    echo "$1:$2"
    if [[ "$1" == "build" ]]; then
      gmake $MKARGS $3 $4      
    else
      gmake $1 $3 $4      
    fi
    if [[ "$?" != "0" ]]; then
      exit 1
    fi
    cd "$D"
  else
    echo "$1: no $2 folder"
  fi
}


if [[ $(echo "${OS_VERSION_ID} > 24.04"|bc) == 1 ]]; then
  make_app $1 "Tools" 'LDFLAGS=-D../../Frameworks/SoundKit/SoundKit.framework/Versions/0.1'
  make_app $1 "DocumentViewer"
fi
if [[ "${OS_ID}" == "ubuntu" && $(echo "${OS_VERSION_ID} > 22.04"|bc) == 1 ]]; then
  make_app $1 "Preferences"
  make_app $1 "ImageViewer"
  make_app $1 "SystemManager"   'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
  make_app $1 "CloudManager"    'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
fi
make_app $1 "Addresses"
make_app $1 "Affiche"
make_app $1 "Librarian"
make_app $1 "Sketch"
make_app $1 "RemoteView"
make_app $1 "Player"

make_app $1 "DefaultsManager" 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
# make_app $1 "TimeMon"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "OpenUp"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "ScreenShot"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "InnerSpace"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "ScanImage"       'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "VolMon"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "DispMon"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "MountUp"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "NetHood"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "Network"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "NotMon"          'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_APPS)'
make_app $1 "GestureHelper"   'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_APPS)'

if [[ $GSDEPTH > 1 ]]; then
  make_app $1 "Calculator"
  make_app $1 "DictionaryReader"
  make_app $1 "FTP"
  make_app $1 "WrapperFactory"  'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
  make_app $1 "HelpViewer"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
  make_app $1 "FontManager"     'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
  make_app $1 "BatMon"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
fi
