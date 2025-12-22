#!/bin/sh
set -e

cp ../config/etc/ld.so.conf.d/gs-light.conf /etc/ld.so.conf.d

for DD in `ls -1 *-build_*.sh`; do
  echo "$DD"
  ./$DD || exit 1
done

ln -s /opt/gs-light/Applications /Applications
ln -s /opt/gs-light/Library /Library
