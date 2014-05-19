FROM ubuntu:trusty
MAINTAINER Nick Saika <nicksaika@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:rethinkdb/ppa
RUN apt-get update
RUN apt-get install -y rethinkdb=1.12.4-0ubuntu1~trusty

RUN /usr/bin/rethinkdb create --directory /var/lib/rethinkdb/default

VOLUME ["/var/lib/rethinkdb"]
EXPOSE 8080 28015 29015
ENTRYPOINT ["/usr/bin/rethinkdb", "serve", "--directory", "/var/lib/rethinkdb/default", "--bind", "all"]

## After building this image, you will need to run the following commands.
##
## The first command creates the shared volume we will store out data files in:
##
##     $ mkdir -p $HOME/data/rethinkdb/1
##
## Next, we will use the container's rethinkdb executable to initialize the
## data directory:
##
##     $ docker run --rm \
##         -v $HOME/data/rethinkdb/1:/var/lib/rethinkdb \
##	   rethinkdb create -d /var/lib/rethinkdb/default
##
## Finally, to run RethinkDB in a container:
##
##     $ docker run -d -P -v $HOME/data/rethinkdb/1:/var/lib/rethinkdb --name="rethinkdb.1" rethinkdb
##
## Should you want to set up a cluster, you will have to repeat the above steps
## for as many nodes you want in the cluster, but do not start the other
## RethinkDB nodes just yet.
## 
## Inspect the container for our first RethinkDB node. What we are looking for
## is the internal address of the container:
##
##     $ docker inspect rethinkdb.1 | grep IPAddress
##
## When I ran this command, the IPv4 address of that container was 172.17.0.2,
## but that will most-likely be different on your system (if it isn't, don't
## worry).
##
## Now, for every subsequent RethinkDB container we start, we will have to
## specify all of the options that are usually handled by this Dockerfile,
## because we are going to pass some more options to RethinkDB, which will
## effectively blow away the CMD section of this Dockerfile:
##
##     $ docker run -d -P \
##         -v $HOME/data/rethinkdb/2:/var/lib/rethinkdb \
## 	   --name="rethinkdb.2" \
##	   rethinkdb -d /var/lib/rethinkdb/default --bind all --join 172.17.0.2:29015
##
## Note: Port 29015 is the default port RethinkDB uses for cluster
## 	 communication.
##
