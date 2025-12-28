#!/bin/bash
D=`pwd`

. ../env.sh
. ../BUILD_SETTINGS.conf
#. /Developer/Makefiles/GNUstep.sh
. /usr/share/GNUstep/Makefiles/GNUstep.sh

install_app() {
  cd "$D"
  cd ./$1 || exit 1
  echo "install:$1"
  gmake install $2
}

install_app "Tools"
#install_app "Preferences"
install_app "Addresses"
### install_app "Affiche"
install_app "Calculator"
install_app "ImageViewer"
install_app "DocumentViewer"
install_app "DictionaryReader"
install_app "FTP"
install_app "Librarian"
install_app "Sketch"
install_app "RemoteView"
install_app "Player"

install_app "WrapperFactory"  'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "DefaultsManager" 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "HelpViewer"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "FontManager"     'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
### install_app "TimeMon"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "OpenUp"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "ScreenShot"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "InnerSpace"      'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "ScanImage"       'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "SystemManager"   'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
#install_app "CloudManager"    'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "BatMon"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "VolMon"          'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "DispMon"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "MountUp"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "NetHood"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
install_app "Network"         'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'

install_app "NotMon"          'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_APPS)'
install_app "GestureHelper"   'APP_INSTALL_DIR=$(GNUSTEP_SYSTEM_APPS)'

###
cd "$D"
cd ../Applications/Addresses/Goodies/VCFViewer || exit 1
gmake install

###
cd "$D"
cd ../../libs-steptalk/Examples/Shell
gmake install

###
. /Library/Preferences/GNUstep.conf


cd "$D"
cp -R ./Wrappers/WPrefs.app $GNUSTEP_LOCAL_ADMIN_APPS

cp -R ./Wrappers/Lookup.app $GNUSTEP_LOCAL_ADMIN_APPS

cp -a ./Librarian/Tools/* /opt/gs-light/System/bin

cd "$D"
if [ -d "/Applications/GSSpeechRecognitionServer.app" ];then
  mv /Applications/GSSpeechRecognitionServer.app $GNUSTEP_SYSTEM_APPS
fi

if [ -d "/Applications/GSSpeechServer.app" ];then
  mv /Applications/GSSpeechServer.app $GNUSTEP_SYSTEM_APPS
fi
