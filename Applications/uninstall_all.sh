#!/bin/bash
set -e

for DD in `ls -1 *-makesub_*.sh`; do
  echo $DD uninstall
  ./$DD uninstall || exit 1
done
