#!/bin/bash
for DD in `ls -1 *-clean_*.sh`; do
  echo "$DD"
  ./$DD
done
