#!/bin/bash -e

sudo mkdir -p /etc/unbound /etc/wireguard /var/lib/unbound
sudo cp etc/unbound.conf /etc/unbound
sudo cp etc/postup.sh /etc/wireguard
sudo wget -O /var/lib/unbound/root.hints https://www.internic.net/domain/named.cache
sudo chown -R unbound:unbound /var/lib/unbound

mkdir -p ~/.wireguard
cd ~/.wireguard

umask 077
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
