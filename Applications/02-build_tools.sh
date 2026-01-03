#!/bin/bash
D=`pwd`

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

build_app() {
  cd "$D"
  cd ./$1 || exit 1
  echo "build:$1"
  gmake $MKARGS $2 || exit 1
}

build_app "Tools"  'LDFLAGS=-D../../Frameworks/SoundKit/SoundKit.framework/Versions/0.1'
#build_app "Preferences"
build_app "Addresses"
### build_app "Affiche"
#build_app "Calculator"
build_app "ImageViewer"
build_app "DocumentViewer"
#build_app "DictionaryReader"
#build_app "FTP"
build_app "Librarian"
build_app "Sketch"
build_app "RemoteView"
build_app "Player"

#build_app "WrapperFactory"  'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "DefaultsManager" 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
#build_app "HelpViewer"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
#build_app "FontManager"     'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
### build_app "TimeMon"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "OpenUp"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "ScreenShot"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "InnerSpace"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "ScanImage"       'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "SystemManager"   'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
#build_app "CloudManager"    'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
#build_app "BatMon"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "VolMon"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "DispMon"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "MountUp"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "NetHood"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
build_app "Network"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'

build_app "NotMon"          'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_APPS)'
build_app "GestureHelper"   'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_APPS)'

###\\\ 
#cd "$D"
#cd ../Applications/Addresses/Goodies/VCFViewer || exit 1

#gmake $MKARGS || exit 1

#####ldconfig

###
#cd "$D"
#cd ../../libs-steptalk/Examples/Shell

#gmake $MKARGS || exit 1
