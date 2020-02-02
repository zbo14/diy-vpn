#!/bin/bash -e

wg-quick up wg0

cd /etc/wireguard
gpg --output privatekey --decrypt privatekey.asc
gpgconf --reload gpg-agent

wg set wg0 private-key privatekey

rm privatekey
