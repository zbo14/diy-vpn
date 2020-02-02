#!/bin/bash -e

sudo wg-quick up wg0

cd ~/.wireguard
gpg --output privatekey --decrypt privatekey.asc
gpgconf --reload gpg-agent

sudo wg set wg0 private-key privatekey

rm privatekey
