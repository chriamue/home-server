# home-server
Docker containers for a small server environment.

* [gitlab](https://en.wikipedia.org/wiki/GitLab)
* [jenkins](https://en.wikipedia.org/wiki/Jenkins_(software))
* [mattermost](https://about.mattermost.com/)
* [nextcloud](https://en.wikipedia.org/wiki/Nextcloud)
* [nginx](https://en.wikipedia.org/wiki/Nginx)

The users will be managed using [ldap](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol).

## Quick Start

Clone repository:

```git clone https://github.com/chriamue/home-server```

Change into source directory:

```cd developer-environment```

Create your own branch:

```git checkout -b configbranch```

Edit compose for your needs:

```vim .env```

```vim docker-compose.yml```

Commit your changes:

```git commit -m 'updated docker-compose.yml'```

Build and download docker images:

```docker-compose build```

Run docker compose:

```docker-compose up -d```

Stop docker compose:

```docker-compose stop```

## restart server

After a reboot you have to restart the services manually.
Start them in following order.

```bash
docker-compose start openldap
docker-compose start ldapaccountmanager
docker-compose start downloads
docker-compose start gitlab
docker-compose start jenkins
docker-compose start nextcloud-db
docker-compose start nextcloud
docker-compose start nginx
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

## [Jenkins](jenkins/README.md)

Open Jenkins in browser: [http://jenkins.localhost]()

## [Gitlab](gitlab/README.md)

Open Gitlab in browser: [http://gitlab.localhost]()

## [Mattermost](gitlab/README.md)

Open Mattermost in browser: [http://mattermost.localhost]()

## [Nextcloud](nextcloud/README.md)

Open Nextcloud in browser: [http://nextcloud.localhost]()

## [Nginx](nginx/README.md)

Web server here used as proxy to the services.

## [OpenLDAP](openldap/README.md)

## [downloads](downloads/README.md)

## [backup](backup/README.md)
