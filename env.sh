#!/bin/bash

export OS_ID=$(cat /etc/os-release |grep '^ID=' | sed -r 's/^ID\=(.*)$/\1/')
export OS_ID_LIKE=$(cat /etc/os-release |grep '^ID_LIKE=' | sed -r 's/^ID_LIKE\=(.*)$/\1/')
export OS_VERSION_ID=$(cat /etc/os-release |grep '^VERSION_ID=' | sed -r 's/^VERSION_ID\=\"(.*)\"$/\1/')
