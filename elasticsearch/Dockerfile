FROM ubuntu:trusty
MAINTAINER Nick Saika <nicksaika@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y wget openjdk-7-jre-headless
RUN wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
ADD elasticsearch.list /etc/apt/sources.list.d/elasticsearch.list
RUN apt-get update
RUN apt-get install -y elasticsearch=1.2.1
ADD elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
ADD run-elasticsearch.sh /usr/local/bin/run-elasticsearch.sh
RUN chmod a+x /usr/local/bin/run-elasticsearch.sh
EXPOSE 9200
VOLUME ["/var/log/elasticsearch", "/var/lib/elasticsearch"]
CMD ["-c", "/usr/local/bin/run-elasticsearch.sh"]
ENTRYPOINT ["bash"]
