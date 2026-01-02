#!/bin/bash

# delete log files
rm build_world*.log

D=`pwd`
if [[ -e ./build/clean_all.sh ]]; then
  (cd ./build; ./clean_all.sh)
fi

if [[ -e ./Applications/clean_all.sh ]]; then
  (cd ./Applications; ./clean_all.sh)
fi
