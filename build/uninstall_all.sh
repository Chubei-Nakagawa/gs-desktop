#!/bin/bash
for DD in `ls -1 *-makesub_*.sh`; do
  echo "$DD"
  ./$DD uninstall || exit 1
done

for DD in `ls -1 *-uninstall_*.sh`; do
  echo "$DD"
  ./$DD
done
