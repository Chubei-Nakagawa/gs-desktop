#!/usr/bin/env bash

PACKAGES=()
for DD in `cat ./debian.txt` ;do
  RESULT=$(dpkg -l ${DD} 2>/dev/null)
  if [[ -z ${RESULT} ]]; then
    echo "no $DD package" 
    continue
  elif [[ ${RESULT} =~ ==[^\S]ii[^\S] ]];then
    echo "$DD installed" 
  else
    PACKAGES+=( $DD )
  fi
done
apt-get install "${PACKAGES[@]}"

PACKAGES=()
while read DD ;do
  dpkg -l ${DD} 2>/dev/null | grep ^ii >/dev/null 
  RV="$?"
  if [ $RV -eq 0 ];then
    echo "$DD installed" 
    PACKAGES+=( $DD )
  fi
done << EOS
edenmath.app
fontmanager.app
ftp.app
gnumail.app-common
gnumail.app
gworkspace.app
helpviewer.app
terminal.app
helpviewer.app
wmaker
EOS

if [[ ${#PACKAGES[@]} -ne 0 ]]; then
  echo "uninstall ${PACKAGES[@]}"
  apt-get remove --purge -y "${PACKAGES[@]}"
fi