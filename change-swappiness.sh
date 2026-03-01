#!/usr/bin/env bash

if [ -z "$1" ]; then
    DEFAULT_SWAPPINESS=60
else
    DEFAULT_SWAPPINESS=$1
fi

echo "current swappiness: $(cat /proc/sys/vm/swappiness)"

sudo sysctl vm.swappiness=$DEFAULT_SWAPPINESS
echo "Swappiness set to $DEFAULT_SWAPPINESS"