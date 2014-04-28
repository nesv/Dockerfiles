FROM ubuntu:trusty
MAINTAINER Nick Saika <nicksaika@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y

ADD slapd.preseed /tmp/slapd.preseed
RUN debconf-set-selections /tmp/slapd.preseed
RUN rm /tmp/slapd.preseed
RUN apt-get install -y -q slapd ldap-utils

VOLUME ["/srv/ldap/lapdog"]

EXPOSE 389 636
CMD ["/usr/sbin/slapd", "-d3"]