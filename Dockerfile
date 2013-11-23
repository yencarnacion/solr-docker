FROM ubuntu:12.10
MAINTAINER Yamir Encarnacion "yencarnacion@webninjapr.com"
RUN apt-get -qq update
RUN apt-get install -y wget supervisor git-core software-properties-common unzip

# Install Oracle Java 7
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# automatically accept oracle license
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# and install java 7 oracle jdk
RUN apt-get -y install oracle-java7-installer && apt-get clean
RUN update-alternatives --display java
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment

# Install Solr
RUN wget http://archive.apache.org/dist/lucene/solr/4.6.0/solr-4.6.0.zip -P /tmp
RUN (cd /tmp && unzip solr-4.6.0.zip &&  mkdir /opt/apps/ && mv solr-4.6.0 /opt/apps/)
ADD templates/supervisord.conf /etc/supervisord.conf
ADD templates/run.sh /usr/local/bin/run
EXPOSE 8983
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
