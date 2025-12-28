#!/bin/bash
set -e

for DD in `ls -1 *-clean_*.sh`; do
  echo $DD
  ./$DD || exit 1
done
