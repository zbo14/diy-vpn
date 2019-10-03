#!/bin/bash -e

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

mkdir -p /etc/openvpn{,/pki{,/issued,/private}}

cp ca.crt /etc/openvpn
cp client.key /etc/openvpn/pki/private
cp ta.key /etc/openvpn/pki/private
cp client.crt /etc/openvpn/pki/issued
cp client.conf /etc/openvpn
