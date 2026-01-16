#!/usr/bin/env bash

PACKAGES=()
for DD in `cat ./debian.txt` ;do
  dpkg -l ${DD} 2>/dev/null | grep ^ii >/dev/null 
  RV="$?"
  if [ $RV -eq 0 ];then
    echo "$DD installed" 
  else
    PACKAGES+=( $DD )
  fi
done
for DD in "${PACKAGES[@]}";do
  apt-get install -y "${DD}"
done

