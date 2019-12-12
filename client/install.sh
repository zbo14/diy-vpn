#!/bin/bash -e

add-apt-repository ppa:wireguard/wireguard
apt-get update
apt-get -y install openresolv wireguard

