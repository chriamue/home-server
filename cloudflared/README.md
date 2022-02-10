# cloudflared

We use here argo tunnel to prevent exposing our ip.

## Login

First [download](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup) cloudflared and [login](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide#2-authenticate-cloudflared).

## Create tunnel

Now create your tunnel

```sh
cloudflared tunnel create ssh
```

## Config

Tunnel list shows you the ids.

```sh
cloudflared tunnel list
You can obtain more detailed information for each tunnel with `cloudflared tunnel info <name/uuid>`
ID             NAME      CREATED              CONNECTIONS  
234-3-4-2-43534 ssh      2022-02-10T09:01:13Z              
```

Create a subfolder `.cloudflared/` where you copy the tunnel config file like
`234-3-4-2-43534.json` from your home folder `~/.cloudflared/234-3-4-2-43534.json` to.

Create a config file like ssh.yml and replace the servers host ip and the ids.

```yml
url: ssh://192.168.0.42:22
tunnel: 234-3-4-2-43534
credentials-file: /etc/cloudflared/234-3-4-2-43534.json
```

## DNS

Now you can set a cname to 234-3-4-2-43534.argotunnel.com.
