# frp

A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet.

More info at [https://github.com/fatedier/frp/](https://github.com/fatedier/frp/)

## Example client config

```ini
# frpc.ini

[common]
server_addr = frp.example.com
server_port = 7000
token = secrettoken
[web]
type = http
local_port = 3000
subdomain = awesome
```

```bash
./frpc -c frpc.ini
```