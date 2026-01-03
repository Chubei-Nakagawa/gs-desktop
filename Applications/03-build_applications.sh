#!/bin/sh
D=`pwd`
. ../BUILD_SETTINGS.conf
. /usr/share/GNUstep/Makefiles/GNUstep.sh

./03-makesub_applications.sh 

echo "=================="
echo " Terminal App"
echo "=================="

cd "$D"
cd ../../gs-terminal/Terminal || exit 1

gmake clean
gmake $MKARGS || exit 1

echo "=================="
echo " VimGS App"
echo "=================="

cd "$D"
cd ../../gs-terminal/Applications/VimGS || exit 1

gmake clean
gmake $MKARGS || exit 1

echo "=================="
echo " EmacsGS App"
echo "=================="

cd "$D"
cd ../../gs-terminal/Applications/EmacsGS || exit 1

gmake clean
gmake $MKARGS || exit 1

echo "=================="
echo " GNUPlot"
echo "=================="

cd "$D"
cd ../../gs-terminal/Applications/GNUPlot || exit 1

gmake clean
gmake $MKARGSG || exit 1

echo "=================="
echo " HtopGS App"
echo "=================="

cd "$D"
cd ../../gs-terminal/Applications/HtopGS || exit 1

gmake clean
gmake $MKARGS || exit 1

echo "=================="
echo " Console App"
echo "=================="

cd "$D"
cd ../../gs-terminal/Applications/Console || exit 1

gmake clean
gmake $MKARGS || exit 1

echo "=================="
echo " Web Browser"
echo "=================="

cd "$D"
cd ../../gs-webbrowser || exit 1

gmake clean
gmake $MKARGS || exit 1

#echo "=================="
#echo " TextEdit App"
#echo "=================="
##cd "$D"
#cd ../../gs-textedit || exit 1

#gmake clean
#gmake $MKARGS || exit 1

echo "=================="
echo " Mail App"
echo "=================="
cd "$D"
cd ../../gs-mail || exit 1

gmake clean
gmake $MKARGS || exit 1

echo "=================="
echo " TalkSoap App"
echo "=================="
cd "$D"
cd ../../gs-talksoup || exit 1

gmake clean
gmake $MKARGS || exit 1

echo "=================="
echo " SimpleAgenda App"
echo "=================="
cd "$D"
cd ../../simpleagenda || exit 1

gmake clean
./configure || exit 1
gmake $MKARGS || exit 1
