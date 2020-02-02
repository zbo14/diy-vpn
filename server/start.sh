#!/bin/bash -e

sudo wg-quick up wg0

cd /etc/wireguard
gpg --decrypt privatekey.gpg --output privatekey

sudo wg set wg0 private-key privatekey

rm privatekey
