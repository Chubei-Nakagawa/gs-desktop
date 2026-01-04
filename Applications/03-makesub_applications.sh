#!/bin/bash
D=`pwd`

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

make_app() {
  cd "$D"
  if [[ -e $3 ]]; then
    echo "=================="
    echo " $1 $2"
    echo "=================="
    (cd "$3"; gmake "$1" "$4")
  else
    echo "$1: no $3 folder"
  fi
}

make_app $1 "Terminal App" "../../gs-terminal/Terminal"
make_app $1 "VimGS App" "../../gs-terminal/Applications/VimGS"
make_app $1 "EmacsGS App" "../../gs-terminal/Applications/EmacsGS"
make_app $1 "GNUPlot" "../../gs-terminal/Applications/GNUPlot"
make_app $1 "HtopGS App" "../../gs-terminal/Applications/HtopGS" 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "Console App" "../../gs-terminal/Applications/Console" 'APP_INSTALL_DIR=$(GNUSTEP_LOCAL_ADMIN_APPS)'
make_app $1 "Web Browser" "../../gs-webbrowser"
#make_app $1 "TextEdit App" "../../gs-textedit"
make_app $1 "Mail App" "../../gs-mail"
make_app $1 "TalkSoap App" "../../gs-talksoup"
make_app $1 "SimpleAgenda App" "../../simpleagenda"
