#!/bin/bash -e

## Set iptables rule for NAT
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 10.9.0.0/24 -o eth0 -j MASQUERADE

## Enable IPv4 forwarding
sysctl -w net.ipv4.ip_forward=1

## Start OpenVPN
openvpn /etc/openvpn/server.conf
