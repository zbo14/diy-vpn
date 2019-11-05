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
  wget \
  zip

rm -rf easy-rsa /etc/openvpn openvpn-2.4.7

wget https://swupdate.openvpn.org/community/releases/openvpn-2.4.7.tar.gz
gzip -dc openvpn-2.4.7.tar.gz | tar xvf -
rm openvpn-2.4.7.tar.gz

cd openvpn-2.4.7
./configure
make
make install
cd ..

git clone https://github.com/OpenVPN/easy-rsa.git
cp vars easy-rsa/easyrsa3/vars
cd easy-rsa/easyrsa3

./easyrsa init-pki
./easyrsa build-ca
./easyrsa build-server-full server
./easyrsa gen-dh
openvpn --genkey --secret /etc/openvpn/pki/private/ta.key
./easyrsa gen-crl
cd ../..

cp server.conf /etc/openvpn/server.conf

read -p "Enter the password for the server's private-key: " -s pass
echo "$pass" > /etc/openvpn/pass
chmod 600 /etc/openvpn/pass

cp diy-vpn.service /etc/systemd/system
cp diy-vpn.sh /usr/bin
