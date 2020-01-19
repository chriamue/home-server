# wireguard - vpn

## first run

If the wireguard kernel module is not already installed on the host system, use this first run command to install it:

```bash
docker run -it --rm --cap-add sys_module -v /lib/modules:/lib/modules cmulk/wireguard-docker:buster install-module
```

## generate keys

```bash
docker-compose run --rm vpn genkeys
```

## configuration

Copy server.conf to ./srv/data/etc/wireguard and edit private and public keys.

## add clients

Generate new keys and add them to the server config.

```bash
[Peer]
PublicKey = <client_public_key>
AllowedIPs = 10.0.42.x
```

Edit wg0.conf and copy it to the clients computer.

## connect

```bash
wg-quick up wg0.conf
```

## disconnect

```bash
wg-quick down wg0.conf
```
