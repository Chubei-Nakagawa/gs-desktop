#!/bin/sh
set -e

for DD in `ls -1 *-makesub_*.sh`; do
  echo "$DD"
  ./$DD install || exit 1
done

for DD in `ls -1 *-install_*.sh`; do
  echo "$DD"
  ./$DD || exit 1
done

/sbin/ldconfig
