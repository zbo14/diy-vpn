#!/bin/bash -e

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:wireguard/wireguard
sudo apt-get update

sudo apt-get install -y \
    gnupg2 \
    unbound \
    unbound-host \
    wireguard
