#!/bin/sh
set -e

#cp ../config/etc/ld.so.conf.d/gs-light.conf /etc/ld.so.conf.d
#ldconfig

for DD in `ls -1 *-install_*.sh`; do
  echo "$DD"
  ./$DD || exit 1
done
