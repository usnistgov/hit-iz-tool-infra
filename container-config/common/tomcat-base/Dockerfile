# Pull base image.
FROM ubuntu-base

ENV TOMCAT_VERSION 8.5.28

# This is in accordance to : https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

#RUN \
#  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
#  add-apt-repository -y ppa:webupd8team/java && \
#  apt-get update && \
#  apt-get install -y oracle-java8-installer && \
#  rm -rf /var/lib/apt/lists/* && \
#  rm -rf /var/cache/oracle-jdk8-installer


RUN apt-get update && \
	apt-get install -y ca-certificates-java && \
	apt-get install -y zip && \
	apt-get clean && \
	update-ca-certificates -f && \
	rm -rf /var/lib/apt/lists/*


# Setup JAVA_HOME, this is useful for docker commandline
#ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
RUN export JAVA_HOME

# Get Tomcat
RUN wget --quiet --no-cookies http://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz && \
tar xzvf /tmp/tomcat.tgz -C /opt && \
mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
rm /tmp/tomcat.tgz && \
rm -rf /opt/tomcat/webapps/examples && \
rm -rf /opt/tomcat/webapps/docs && \
rm -rf /opt/tomcat/webapps/manager && \
rm -rf /opt/tomcat/webapps/host-manager && \
rm -rf /opt/tomcat/webapps/ROOT

ENV CATALINA_HOME /opt/tomcat
ENV JAVA_OPTS="-Xms1024m -Xmx2048m"
RUN export JAVA_OPTS

ENV PATH $PATH:$CATALINA_HOME/bin

COPY ./mysql-connector-java-5.1.42.jar  $CATALINA_HOME/lib

EXPOSE 8080

WORKDIR /opt/tomcat
