#!/usr/bin/env bash

if [ -z "$1" ]; then
    DEFAULT_MEMORY=8
else
    DEFAULT_MEMORY=$1
fi

sudo swapoff -a #disable current swap

cmd=$(sudo fallocate -l ${DEFAULT_MEMORY}G /swapfile)
echo "Creating swap file with command: $cmd"

sudo chmod 600 /swapfile #only readable/writeable by root
echo "Setting permissions for /swapfile to 600"

sudo mkswap /swapfile #make the file a swap file
echo "Making /swapfile a swap file"

sudo swapon /swapfile #enable the swap file
echo "Enabling /swapfile as swap"

echo "Swap file created and enabled with size ${DEFAULT_MEMORY}G"

echo "To maintain swap after reboot, add the following line to /etc/fstab:"
echo "/swapfile none swap sw 0 0"
# How to maintain swap after reboot:
# Add the following line to /etc/fstab:
# /swapfile none swap sw 0 0
# check mem
# free -h