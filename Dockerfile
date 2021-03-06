FROM ubuntu:14.04

RUN \
   apt-get update && \
   apt-get -y upgrade && \
   apt-get -y install software-properties-common && \
   add-apt-repository ppa:webupd8team/java -y && \
   apt-get update && \
   (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections) && \
   apt-get install -y oracle-java8-installer oracle-java8-set-default

WORKDIR /data
WORKDIR /data/simpleapp

COPY SimpleApp.java .

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN javac SimpleApp.java

CMD ["java","SimpleApp"]
