FROM ubuntu:trusty
MAINTAINER Nick Saika <nicksaika@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y spawn-fcgi

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-e info", "-DFOREGROUND"]