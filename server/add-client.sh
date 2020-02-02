#!/bin/bash -e

if [ "$#" -lt 2 ]; then
    echo "Usage: add-client <ip> <pubkey>"
    exit 1
fi

wg set wg0 peer "$2" allowed-ips "$1"/32
