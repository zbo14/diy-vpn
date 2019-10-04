#!/bin/bash -e
apt update

apt -y install \
  build-essential \
  git \
  lzop \
  liblzo2-dev \
  libpam-dev \
  libssl-dev \
  liblz4-dev \
  net-tools \
  openssl \
  wget

wget https://swupdate.openvpn.org/community/releases/openvpn-2.4.7.tar.gz
gzip -dc openvpn-2.4.7.tar.gz | tar xvf -

cd openvpn-2.4.7
./configure
make
make install
cd ..

git clone https://github.com/OpenVPN/easy-rsa.git
cp vars easy-rsa/earsa3/vars
cd easy-rsa/easyrsa3

./easyrsa init-pki
./easyrsa build-ca
./easyrsa build-server-full server
./easyrsa gen-dh
openvpn --genkey --secret /etc/openvpn/pki/private/ta.key
cd ../..

cp server.conf /etc/openvpn/server.conf

sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -s 10.9.0.0/24 -o eth0 -j MASQUERADE
