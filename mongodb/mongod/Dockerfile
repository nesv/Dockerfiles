FROM mongodb/base:latest
MAINTAINER Nick Saika <nicksaika@gmail.com>

VOLUME ["/var/lib/mongodb"]
EXPOSE 27017
ENTRYPOINT ["/usr/bin/mongod", "--dbpath", "/var/lib/mongodb", "--bind_ip", "0.0.0.0", "--port", "27017"]
