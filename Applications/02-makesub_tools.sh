#!/bin/bash
D=`pwd`

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

make_app() {
  cd "$D"
  if cd ./$2; then
    echo "$1:$2"
    gmake $1 $3 $4
  else
    echo "$1: no $2 folder"
  fi
}

make_app $1 "Tools"
#make_app $1 "Preferences"
make_app $1 "Addresses"
#make_app $1 "Calculator"
make_app $1 "ImageViewer"
make_app $1 "DocumentViewer"
#make_app $1 "DictionaryReader"
make_app $1 "Librarian"
make_app $1 "Sketch"
make_app $1 "RemoteView"
make_app $1 "Player"

make_app $1 "WrapperFactory"  'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "DefaultsManager" 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
#make_app $1 "HelpViewer"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
#make_app $1 "FontManager"     'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
### make_app $1 "TimeMon"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "OpenUp"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "ScreenShot"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "InnerSpace"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "ScanImage"       'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "SystemManager"   'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
#make_app $1 "CloudManager"    'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
#make_app $1 "BatMon"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "VolMon"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "DispMon"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "MountUp"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "NetHood"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "Network"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'

make_app $1 "NotMon"          'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_APPS)'
make_app $1 "GestureHelper"   'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_APPS)'
