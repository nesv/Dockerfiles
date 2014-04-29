FROM ubuntu:trusty
MAINTAINER Nick Saika <nicksaika@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
ADD mongodb.list /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mongodb-org
