#!/bin/bash -e

if [ -z "$3" ]; then
    echo "Usage: configure <gateway> <ip> <pubkey>"
    exit
fi

rm -rf /etc/wireguard
mkdir /etc/wireguard

umask 277
privatekey="$(wg genkey)"
echo "$privatekey" | wg pubkey > /etc/wireguard/publickey

echo '[Interface]
Address = '$2'/32
DNS = 10.200.200.1
PrivateKey='$privatekey'

[Peer]
AllowedIPs = 0.0.0.0/0
Endpoint = '$1':51820
PersistentKeepalive = 25
PublicKey = '$3 > /etc/wireguard/wg0.conf

echo "Client public key: $(cat /etc/wireguard/publickey)"
