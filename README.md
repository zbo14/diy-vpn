# diy-vpn

Running your own VPN involves a fair amount of work, some of which can be automated. This project automates some of the work with bash scripts and provides pre-made config files, hopefully making the process a little easier.

There are two branches, [one](https://github.com/zbo14/diy-vpn/tree/openvpn) for bootstrapping your own [OpenVPN](https://openvpn.net/) infrastructure and [another](https://github.com/zbo14/diy-vpn/tree/wireguard) for running a [WireGuard](https://www.wireguard.com/) VPN.

The POC is a personal-use VPN. A server runs somewhere with a public IP address, probably on some cloud-hosting platform. The server can add/remove clients (e.g. your laptop or your phone) that are/aren't allowed to authenticate. Each client is assigned a tunnel IP address and is authenticated with a public key/certificate.

Suppose you're browsing the web on your laptop and you want to use the VPN. Your laptop would automagically encrypt its traffic such that the server is the only party that could feasibly decrypt it, and then send the encrypted packets to the server. The server would decrypt the packets and forward them to whatever site you're visiting (e.g. "foobar.com"). The server receives packets back from "foobar.com", encrypts them such that your laptop is the only party that could feasibly decrypt them, and sends them to your laptop.
