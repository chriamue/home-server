# home-server
Docker containers for a small server environment.

This project aims to provide Docker configurations for a small server environment. It's primarily a personal documentation effort and may not be production-ready. It is maintained on an as-needed basis, meaning updates might be infrequent. However, it's open to anyone who wants a starting point or to learn more about creating a Docker-based server environment.

![deployment diagram](https://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/chriamue/home-server/master/deployment.puml)

## Supported Services

* [gitlab](https://en.wikipedia.org/wiki/GitLab)
* [nextcloud](https://en.wikipedia.org/wiki/Nextcloud)
* [traefik](https://en.wikipedia.org/wiki/Traefik)
* whoami - A simple container that responds with its container ID, useful for testing load balancing and proxying.
* kanidm - A modern, secure and fast identity management platform.
* vaultwarden - An unofficial Bitwarden compatible server written in Rust.
* vpn - WireGuard VPN for secure networking.
* plantuml - A tool for creating UML diagrams from a plain text language.
* openldap - OpenLDAP software for Lightweight Directory Access Protocol.

The users will be managed using [ldap](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol).

## Installing Portainer

[Portainer](https://www.portainer.io/) is a lightweight management UI which allows you to easily manage your Docker host or Swarm cluster. It is particularly useful when setting up a home server environment as it provides a visual interface to manage Docker containers.

To install Portainer, you can use the following Docker command:

```bash
docker volume create portainer_data
docker run -d -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.19.3
```

This will pull the latest Portainer image from Docker Hub, create a new volume for storing data, and start a new container. The Portainer UI can then be accessed by navigating to http://<your-server-ip>:9443.

For more detailed instructions, refer to the [official Portainer documentation](https://docs.portainer.io).

## Quick Start

Clone repository:

```git clone https://github.com/chriamue/home-server```

Change into source directory:

```cd home-server```

Create your own branch:

```git checkout -b configbranch```

Edit compose for your needs:

```cp example.env .env```

```vim .env```

```vim docker-compose.yml```

Commit your changes:

```git commit -m 'updated docker-compose.yml'```

Build and download docker images:

```docker-compose build```

Start portainer only:

```docker-compose up -d --profile portainer portainer```

Run docker compose:

```docker-compose up -d```

Stop docker compose:

```docker-compose stop```

## restart server

After a reboot you have to restart the services manually.
Start them in following order.

```bash
docker-compose restart openldap
docker-compose restart ldapaccountmanager
docker-compose restart gitlab
docker-compose restart nextcloud-db
docker-compose restart nextcloud
docker-compose restart traefik
```

## update git repo

```bash
git pull
git merge master
```

## Upgrade services

Stop SERVICE:

```docker-compose stop SERVICE```

Remove old SERVICE:

```docker-compose rm SERVICE```

Change to subfolder of SERVICE.
Edit the Dockerfile.
Change version number.
Start new SERVICE:

```docker-compose up -d SERVICE```

## Tips

To test locally change `127.0.0.1 localhost jenkins.localhost lam.localhost gitlab.localhost`
in your /etc/hosts file.

### btrfs

Use a btrfs filesystem.
Create a subvolume for data persistence.

```bash
cd /
sudo btrfs subvolume create srv
```

### renew your certificates

Add ```--expand``` to certbot command in docker-compose.yml file.

```bash
docker-compose stop
docker-compose run --rm -p 80:80 -p 443:443 certbot
docker-compose start ...
```

### upgrade gitlab

If you have problems upgrading gitlab, try this:

```bash
docker run -P -ti -v /srv/data/var/lib/gitlab:/var/opt/gitlab -v /srv/data/etc/gitlab:/etc/gitlab -v /srv/data/var/log/gitlab:/var/log/gitlab --rm gitlab/gitlab-ce bash
```

Inside container run:

```bash
update-permissions
/opt/gitlab/embedded/bin/runsvdir-start & sleep 10 && gitlab-ctl reconfigure
```

## [lam](ldap-account-manager/README.md) (ldap account manager)

Open ldap account manager in browser: [http://lam.localhost]()

## [Gitlab](gitlab/README.md)

Open Gitlab in browser: [http://gitlab.localhost]()

## [Nextcloud](nextcloud/README.md)

Open Nextcloud in browser: [http://nextcloud.localhost]()

## [Nginx](nginx/README.md)

Web server here used as proxy to the services.

## [cloudflared](cloudflared/README.md)

Argo tunnel as alternative to nginx proxy.

## [OpenLDAP](openldap/README.md)

## [backup](backup/README.md)
