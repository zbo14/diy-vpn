#!/bin/bash -e

if [ "$#" -lt 3 ]; then
    echo "Usage: configure <gateway> <ip> <pubkey>"
    exit 1
fi

rm -rf /etc/wireguard
mkdir /etc/wireguard

cd /etc/wireguard
umask 277
wg genkey > privatekey
wg pubkey < privatekey > publickey

gpg --armor --symmetric privatekey.gpg
gpgconf --reload agent
rm privatekey

echo '[Interface]
Address = '"$2"'/32
DNS = 10.200.200.1

[Peer]
AllowedIPs = 0.0.0.0/0
Endpoint = '"$1"':51820
PersistentKeepalive = 25
PublicKey = '"$3" > wg0.conf

echo "Client public key: $(cat publickey)"
