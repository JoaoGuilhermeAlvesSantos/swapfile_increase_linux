#!/usr/bin/env bash

if [ -z "$1" ]; then
    DEFAULT_MEMORY=8
else
    DEFAULT_MEMORY=$1
fi

sudo swapoff -a #disable current swap

cmd=$(sudo fallocate -l ${DEFAULT_MEMORY}G /swapfile)
sudo chmod 600 /swapfile #only readable/writeable by root
sudo mkswap /swapfile #make the file a swap file
sudo swapon /swapfile #enable the swap file


# How to maintain swap after reboot:
# Add the following line to /etc/fstab:
# /swapfile none swap sw 0 0
# check mem
# free -h