# diy-vpn
A collection of scripts and config files to set up/run a [WireGuard](https://www.wireguard.com/) VPN server and provision clients.

The VPN host runs its own [Unbound](https://en.wikipedia.org/wiki/Unbound_(DNS_server)) DNS server to handle client queries/prevent [DNS leaking](https://en.wikipedia.org/wiki/DNS_leak).

## Server

### Install
TODO

### Usage
TODO

## Client

### Install
TODO

### Usage
TODO

## Contributing
If you find a bug, have a question, or think of an improvement, feel free to open an issue!

Here are a few ways you could make `diy-vpn` better:
* [x] Implement encryption of private keys
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
