FROM ubuntu:saucy
MAINTAINER Nick Saika <nicksaika@gmail.com>

RUN apt-get update

ADD slapd.preseed /tmp/slapd.preseed
RUN debconf-set-selections /tmp/slapd.preseed
RUN rm /tmp/slapd.preseed
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y -q slapd ldap-utils

EXPOSE 389
CMD ["/usr/sbin/slapd", "-d3"]

