#!/bin/bash -e

if [[ -z "$1" || -z "$2" ]]
then
  echo "Usage: add-client <ip> <pubkey>"
  exit
fi

wg set wg0 peer "$2" allowed-ips "$1"/32
