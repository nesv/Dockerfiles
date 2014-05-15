FROM ubuntu:trusty
MAINTAINER Nick Saika <nicksaika@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y

# Install protoc-2.5.0
RUN apt-get install -y protobuf-compiler libprotobuf-dev libprotobuf-java

# Install hadoop
RUN apt-get install -y openjdk-7-jdk maven
WORKDIR /tmp
ADD http://apache.sunsite.ualberta.ca/hadoop/common/hadoop-2.3.0/hadoop-2.3.0-src.tar.gz /tmp/hadoop-2.3.0-src.tar.gz
ADD http://apache.sunsite.ualberta.ca/hadoop/common/hadoop-2.3.0/hadoop-2.3.0.tar.gz /tmp/hadoop-2.3.0.tar.gz
RUN tar -zxvf hadoop-2.3.0.tar.gz
WORKDIR hadoop-2.3.0
RUN mvn clean install -DskipTests
WORKDIR hadoop-mapreduce-project
RUN mvn clean install assembly:assembly -Pnative
