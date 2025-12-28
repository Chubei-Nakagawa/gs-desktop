#!/bin/bash
D=`pwd`

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

clean_app() {
  cd "$D"
  if cd ./$1; then
    echo "clean:$1"
    gmake clean
  else
    echo "$1: no $1 folder"
  fi
}

clean_app "Tools"
clean_app "Addresses"
#clean_app "Calculator"
clean_app "ImageViewer"
clean_app "DocumentViewer"
#clean_app "DictionaryReader"
clean_app "Librarian"
clean_app "Sketch"
clean_app "RemoteView"
clean_app "Player"

clean_app "WrapperFactory"
clean_app "DefaultsManager" 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
clean_app "OpenUp"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
clean_app "ScreenShot"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
clean_app "InnerSpace"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
clean_app "ScanImage"       'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
clean_app "SystemManager"   'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
#clean_app "CloudManager"    'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
clean_app "VolMon"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
clean_app "DispMon"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
clean_app "MountUp"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
clean_app "NetHood"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
clean_app "Network"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'

clean_app "NotMon"          'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_APPS)'
clean_app "GestureHelper"   'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_APPS)'


