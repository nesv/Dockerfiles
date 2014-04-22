FROM ubuntu:saucy
MAINTAINER Nick Saika <nicksaika@gmail.com>

RUN apt-get update
RUN apt-get install -y slapd ldapscripts

ADD slapd.conf /etc/ldap/slapd.conf

EXPOSE 389
CMD ["/usr/sbin/slapd", "-d3", "-u", "ldap", "-g", "ldap"]

