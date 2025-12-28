#!/bin/sh
D=`pwd`

. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

cd "$D"
if cd ../../gs-terminal/Applications/VimGS; then
  echo "=================="
  echo " VimGS App"
  echo "=================="
  gmake clean
fi

echo "=================="
echo " EmacsGS App"
echo "=================="
cd "$D"
cd ../../gs-terminal/Applications/EmacsGS || exit 1
gmake clean

echo "=================="
echo " GNUPlot"
echo "=================="
cd "$D"
cd ../../gs-terminal/Applications/GNUPlot || exit 1
gmake clean

echo "=================="
echo " HtopGS App"
echo "=================="
cd "$D"
cd ../../gs-terminal/Applications/HtopGS || exit 1
gmake clean

echo "=================="
echo " Console App"
echo "=================="
cd "$D"
cd ../../gs-terminal/Applications/Console || exit 1
gmake clean

echo "=================="
echo " Web Browser"
echo "=================="
cd "$D"
cd ../../gs-webbrowser || exit 1
gmake clean

#echo "=================="
#echo " TextEdit App"
#echo "=================="
##cd "$D"
#cd ../../gs-textedit || exit 1
#gmake clean

echo "=================="
echo " Mail App"
echo "=================="

cd "$D"
cd ../../gs-mail || exit 1
gmake clean

echo "=================="
echo " SimpleAgenda App"
echo "=================="

cd "$D"
cd ../../simpleagenda || exit 1
gmake clean
