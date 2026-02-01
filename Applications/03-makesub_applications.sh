#!/bin/bash
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

GSDEPTH=${GSDEPTH:-2}
D=`pwd`

make_app() {
  cd "$D"
  if [[ -e $3 ]]; then
    echo "=================="
    echo " $1 $2"
    echo "=================="
    cd "$3"
    if [[ "$1" == "build" ]]; then
      gmake $MKARGS || exit 1
    else
      if [[ -z "$4" ]]; then
        gmake "$1"
      else
        gmake "$1" "$4"
      fi
    fi
  else
    echo "$1: no $3 folder"
  fi
}

make_app $1 "VimGS App" "../../gs-terminal/Applications/VimGS"
make_app $1 "EmacsGS App" "../../gs-terminal/Applications/EmacsGS"
make_app $1 "GNUPlot" "../../gs-terminal/Applications/GNUPlot"
make_app $1 "HtopGS App" "../../gs-terminal/Applications/HtopGS" 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "Console App" "../../gs-terminal/Applications/Console" 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "Web Browser" "../../gs-webbrowser"
#make_app $1 "TextEdit App" "../../gs-textedit"
if [[ $GSDEPTH > 1 ]]; then
  if [[ "${OS_ID}" == "ubuntu" && $(echo "${OS_VERSION_ID} > 22.04"|bc) == 1 ]]; then
    make_app $1 "Terminal App" "../../gs-terminal/Terminal"
  fi
  make_app $1 "Mail App" "../../gs-mail"
  make_app $1 "TalkSoap App" "../../gs-talksoup"
  make_app $1 "SimpleAgenda App" "../../simpleagenda"
fi
