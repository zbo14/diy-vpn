#!/bin/bash -e

if [ "$#" -lt 2 ]; then
    echo "Usage: addclient <ip> <pubkey>"
    exit 1
fi

sudo wg set wg0 peer "$2" allowed-ips "$1"/32
