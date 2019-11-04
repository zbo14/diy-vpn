#!/bin/bash -e

apt-get update
apt-get install -y software-properties-common
add-apt-repository ppa:wireguard/wireguard

apt-get install -y \
  unbound \
  unbound-host \
  wget \
  wireguard

wget -O /var/lib/unbound/root.hints https://www.internic.net/domain/named.cache

rm -rf /etc/{iptables,unbound,wireguard}
mkdir /etc/{iptables,unbound,wireguard}

cp unbound.conf /etc/unbound
chown -R unbound:unbound /var/lib/unbound

cp post-up.sh /etc/wireguard

umask 277
privatekey="$(wg genkey > privatekey)"
echo "$privatekey" | wg pubkey > /etc/wireguard/publickey

echo '[Interface]
Address = 10.200.200.1/24
ListenPort = 51820
PostUp = bash /etc/wireguard/post-up.sh
Privatekey='$privatekey'
SaveConfig = true' >> /etc/wireguard/wg0.conf

echo "Server public key: $(cat /etc/wireguard/publickey)"
