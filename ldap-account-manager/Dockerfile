FROM debian:jessie

ENV HOME /root

RUN apt-get update && \
    C_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y ldap-account-manager

# copy default config lam
RUN cp -r /var/lib/ldap-account-manager/config /opt/lam

EXPOSE 80

RUN rm /etc/apache2/sites-enabled/*default*

RUN mkdir -p /etc/service/apache2
ADD apache2.sh /etc/service/apache2/run

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
