#!/bin/bash -e

if [[ -z $1 ]]
then
  echo "Usage: new-client USERNAME"
  exit
fi

./easy-rsa/easyrsa3/easyrsa build-client-full $1

mkdir -p openvpn openvpn/private

cp client.conf openvpn/client.conf
cp /etc/openvpn/pki/ca.crt openvpn/ca.crt
cp /etc/openvpn/pki/issued/$1.crt openvpn/client.crt
cp /etc/openvpn/pki/private/$1.key openvpn/private/client.key
cp /etc/openvpn/pki/private/ta.key openvpn/private/ta.key

zip -r openvpn.zip openvpn
gpg --compress-algo none --symmetric openvpn.zip
gpgconf --reload gpg-agent
rm -r openvpn{,.zip}
