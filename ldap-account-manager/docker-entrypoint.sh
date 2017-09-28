#!/bin/bash
set -e

if [ -z "$(ls -A "/var/lib/ldap-account-manager")" ]; then
   cp -r /opt/lam/* /var/lib/ldap-account-manager/
   chown www-data:www-data -R /var/lib/ldap-account-manager/*
fi

/usr/sbin/apache2ctl -D FOREGROUND
