# diy-vpn
A tool to set up/run a [WireGuard](https://www.wireguard.com/) VPN server on Ubuntu and provision clients.

The VPN host runs its own [Unbound](https://en.wikipedia.org/wiki/Unbound_(DNS_server)) DNS server to handle client queries/prevent [DNS leaking](https://en.wikipedia.org/wiki/DNS_leak).

## Server

### Install
Installation has been tested on Ubuntu 18.04.3 LTS (Bionic Beaver).

Clone the repo, `cd` into the server subdirectory, and `sudo bash install.sh`.

The script installs WireGuard and Unbound. It then creates `/etc` subdirectories for WireGuard and Unbound, copies some files over, and generates private and public keys for the server.

### Usage

#### Start
```
$ sudo systemctl start wg-quick@wg0.service
```

This command brings up the WireGuard interface, sets iptables rules, enables IPv4 forwarding, and (re)starts the DNS server.

#### Stop
```
$ sudo systemctl stop wg-quick@wg0.service
```

This command brings down the WireGuard interface and saves the current config.

#### View status
```
$ sudo systemctl status wg-quick@wg0.service
```

#### View interface/clients
```
$ sudo wg show
```

#### Add a client
Once you've started the VPN server, you can add clients that are allowed to authenticate/connect to the server. If you stop the server, it saves the current config so you don't have to re-add the clients when you restart it.

First, `cd` into the server subdirectory and `sudo bash add.client.sh <ip> <pubkey>`.

The `<ip>` is the client's tunnel address and `<pubkey>` is the client's public key generated during [configuration](#Configure).

#### Remove a client
Assuming the client's been added, you can `cd` into the server subdirectory and `sudo bash remove-client.sh <pubkey>` where `<pubkey>` is the client's public key.

## Client

### Configure
Make sure you have WireGuard installed.

Then clone the repo, `cd` into the client subdirectory, and `sudo bash configure.sh <gateway> <ip> <pubkey>`.

The `<gateway>` is the server's address or hostname, `<ip>` is the clients' tunnel address, and `<pubkey>` is the server's public key. The script creates a directory with the client config and generates private and public keys for the client.

### Usage

#### Start
```
$ sudo systemctl start wg-quick@wg0.service

or

$ sudo wg-quick up wg0
```

This command brings up the WireGuard interface.

#### Stop
```
$ sudo systemctl stop wg-quick@wg0.service

or

$ sudo wg-quick down wg0
```

This command brings down the WireGuard interface and saves the current config.

#### View interface/server
```
$ sudo wg show
```

## Contributing
If you find a bug, have a question, or think of an improvement, feel free to open an issue!

Here are a few ways you could make `diy-vpn` better:
* [ ] Implement encryption of private keys
* [ ] Configure Unbound to use DNS-over-TLS
* [ ] Configure WireGuard peers to use preshared keys

## Resources

### WireGuard docs
  * [Installation](https://www.wireguard.com/install/)
  * [Quick start](https://www.wireguard.com/quickstart/)
  * [Whitepaper](https://www.wireguard.com/papers/wireguard.pdf)

### WireGuard tools
  * [`wg` manpage](https://jlk.fjfi.cvut.cz/arch/manpages/man/wg.8)
  * [`wg-quick` manpage](https://jlk.fjfi.cvut.cz/arch/manpages/man/wg-quick.8)

### Arch Linux docs
  * [WireGuard](https://wiki.archlinux.org/index.php/WireGuard)
  * [Firewall with iptables](https://wiki.archlinux.org/index.php/Simple_stateful_firewall)
  * [Unbound](https://wiki.archlinux.org/index.php/unbound)

### Blog posts
  * [this one](https://www.ckn.io/blog/2017/11/14/wireguard-vpn-typical-setup/)
