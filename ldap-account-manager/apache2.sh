#!/bin/bash


if [ ! -e /var/lib/ldap-account-manager/config/docker_bootstrapped ]; then
  cp -r /opt/lam/* /var/lib/ldap-account-manager/config/
  chown www-data:www-data /var/lib/ldap-account-manager/config -R
  touch /var/lib/ldap-account-manager/config/docker_bootstrapped
else
  status "found already-configured lam"
fi


source /etc/apache2/envvars
exec apache2 -D FOREGROUND
