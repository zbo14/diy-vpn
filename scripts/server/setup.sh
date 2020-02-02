#!/bin/bash -e

sudo mkdir -p /etc/unbound /etc/wireguard
sudo cp etc/unbound.conf /etc/unbound
sudo cp etc/postup.sh /etc/wireguard

mkdir -p ~/.wireguard
cd ~/.wireguard

umask 277
wg genkey > privatekey
wg pubkey < privatekey > publickey

gpg --armor --symmetric privatekey
gpgconf --reload gpg-agent
rm privatekey

echo '[Interface]
Address = 10.200.200.1/24
ListenPort = 51820
PostUp = bash /etc/wireguard/postup.sh
SaveConfig = true' | sudo tee /etc/wireguard/wg0.conf > /dev/null

echo "Server public key: $(cat publickey)"
