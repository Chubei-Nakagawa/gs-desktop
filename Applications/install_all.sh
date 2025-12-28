#!/bin/sh
set -e

for DD in `ls -1 *-install_*.sh`; do
  echo $DD
  ./$DD || exit 1
done
