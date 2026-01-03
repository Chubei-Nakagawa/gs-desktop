#!/bin/bash
for DD in `ls -1 *-makesub_*.sh`; do
  echo "$DD"
  ./$DD clean || exit 1
done
