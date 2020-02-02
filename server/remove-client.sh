#!/bin/bash -e

if [ -z "$1" ]; then
    echo "Usage: remove-client <pubkey>"
    exit 1
fi

wg set wg0 peer "$1" remove
