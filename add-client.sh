#!/bin/bash -e

if [ -z $1 ]; then
    echo "Usage: add-client <username>"
    exit
fi

./easy-rsa/easyrsa3/easyrsa build-client-full $1

mkdir -p clients openvpn{,/private}

cp client.conf openvpn/client.conf
cp /etc/openvpn/pki/ca.crt openvpn/ca.crt
cp /etc/openvpn/pki/issued/$1.crt openvpn/client.crt
cp /etc/openvpn/pki/private/$1.key openvpn/private/client.key
cp /etc/openvpn/pki/private/ta.key openvpn/private/ta.key

zip -er clients/$1.zip openvpn
rm -r openvpn
