# home-server
Docker containers for a small server environment.

* [gitlab](https://en.wikipedia.org/wiki/GitLab)
* [jenkins](https://en.wikipedia.org/wiki/Jenkins_(software))
* [nextcloud](https://en.wikipedia.org/wiki/Nextcloud)
* [nginx](https://en.wikipedia.org/wiki/Nginx)

The users will be managed through [ldap](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol).

## Quick Start

Clone repository:

```git clone https://github.com/chriamue/home-server```

Change into source directory:

```cd developer-environment```

Create your own branch:

```git checkout -b configbranch```

Edit compose for your needs:

```vim docker-compose.yml```

Commit your changes:

```git commit -m 'updated docker-compose.yml'```

Build and download docker images:

```docker-compose build```

Run docker compose:

```docker-compose up -d```

Stop docker compose:

```docker-compose stop```

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

## Tipps

To test locally change `127.0.0.1 localhost jenkins.localhost lam.localhost gitlab.localhost`
in your /etc/hosts file.

## btrfs

Use a btrfs filesystem.
Create a subvolume for data persistence.

```bash
cd /
sudo btrfs subvolume create srv
```

### renew your certificates

```bash
docker-compose stop nginx
docker-compose run --rm certbot
docker-compose start nginx
```

## [lam](ldap-account-manager/README.md) (ldap account manager)

Open ldap account manager in browser: [http://lam.localhost]()

## [Jenkins](jenkins/README.md)

Open Jenkins in browser: [http://jenkins.localhost]()

## [Gitlab](gitlab/README.md)

Open Gitlab in browser: [http://gitlab.localhost]()

## [Nextcloud](nextcloud/README.md)

Open Nextcloud in browser: [http://nextcloud.localhost]()

## [Nginx](nginx/README.md)

Web server here used as proxy to the services.

## [OpenLDAP](openldap/README.md)

## [downloads](downloads/README.md)

## [backup](backup/README.md)