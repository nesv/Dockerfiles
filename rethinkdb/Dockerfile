FROM ubuntu:trusty
MAINTAINER Nick Saika <nicksaika@gmail.com>

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:rethinkdb/ppa
RUN apt-get update
RUN apt-get install -y rethinkdb

RUN /usr/bin/rethinkdb create -d rethinkdb_data

EXPOSE 8080 28015 29015
CMD ["/usr/bin/rethinkdb", "serve", "--bind", "all"]
