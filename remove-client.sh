#!/bin/bash -e

if [[ -z $1 ]]
then
  echo "Usage: remove-client <username>"
  exit
fi

rm clients/$1.zip

./easy-rsa/easyrsa3/easyrsa revoke $1
./easy-rsa/easyrsa3/easyrsa gen-crl
