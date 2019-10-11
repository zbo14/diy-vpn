# diy-vpn

## Install
Clone the repo, `cd` into it, and `sudo bash install.sh`.

This will download and install [OpenVPN](https://openvpn.net/) and [easy-rsa](https://github.com/OpenVPN/easy-rsa). Then it will build the public-key infrastructure (PKI), create a certificate authority (CA), generate a key and sign a certificate for the VPN server. You'll be prompted for CA and server passwords during this process. Finally, it will enable IP forwarding and NAT routing on the host.

## Usage

### Configure
If clients will be using `client.conf`, you'll need to replace `<my-server>` (L42) with the hostname or address of your VPN server. You can modify other configuration options in `client.conf` and `server.conf` if you feel so inclined.

### Add a client
To generate credentials for a client, `cd` into the project directory on the host and run the following commands:

```
$ chmod u+x new-client.sh
$ ./new-client <username>
```

**Note:** you only have to `chmod` once.

This constructs a directory with `client.conf`, the CA certificate, a private key and certificate for the client. Then it zips and encrypts the directory with a password you provide.

The client will need to get the encrypted zip file `<username>.zip`. If you have SSH access to the VPN host, `sftp` should work.

Once the file's on the client device, run the following commands:

```
$ unzip -d ~ <username>.zip
$ rm <username>.zip
```

Now you can find the client files at `~/openvpn`.

### Start the VPN server
We can run `diy-vpn` as a systemd service:

```
$ sudo systemctl start diy-vpn
$ sudo systemctl stop diy-vpn
$ sudo systemctl restart diy-vpn
```

### Connect the client
TODO
