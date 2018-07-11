# Pull base image.
FROM tomcat-base
COPY ./config/context.xml /opt/tomcat/conf/

#RUN wget --quiet --no-cookies https://hit-2015.nist.gov/wars/iztool-cdc.war -O /opt/tomcat/webapps/hit-base-tool.war
COPY ./war/iztool.war /opt/tomcat/webapps/hit-base-tool.war
#RUN mkdir /opt/data/
#RUN chmod 766 /opt/data
#COPY ./config/app-log4j.properties /opt/data/
ENV HIT_LOGGING_DIR /opt/data/logs/
ENV HIT_LOGGING_CONFIG /opt/data/config/app-log4j.properties
ENV RELOAD_DB true


VOLUME ["/opt/data/","/opt/tomcat/logs/"]

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
