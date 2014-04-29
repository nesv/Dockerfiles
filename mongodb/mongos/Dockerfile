FROM mongodb/base:latest
MAINTAINER Nick Saika <nicksaika@gmail.com>

EXPOSE 27017
ENTRYPOINT ["/usr/bin/mongos", "--bind_ip", "0.0.0.0", "--port", "27017"]
