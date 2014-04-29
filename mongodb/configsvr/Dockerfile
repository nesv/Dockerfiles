FROM mongodb/base:latest
MAINTAINER Nick Saika <nicksaika@gmail.com>

VOLUME ["/var/lib/mongodb"]
EXPOSE 27019
ENTRYPOINT ["/usr/bin/mongod", "--configsvr", "--dbpath", "/var/lib/mongodb", "--port", "27019", "--bind_ip", "0.0.0.0"]
