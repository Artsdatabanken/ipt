FROM tomcat:8.5-jdk8
LABEL MAINTAINERS="Markus Döring <mdoering@gbif.org>, Matthew Blissett <mblissett@gbif.org>"

ENV IPT_VERSION=2.4.2-rd9bfb4b
ARG IPT_NAME=ROOT
ENV IPT_DATA_DIR=/srv/ipt

RUN rm -Rf /usr/local/tomcat/webapps \
    && mkdir -p /usr/local/tomcat/webapps/${IPT_NAME} \
    && mkdir -p ${IPT_DATA_DIR} \
    && curl -LSsfo ipt.war https://repository.gbif.org/repository/releases/org/gbif/ipt/${IPT_VERSION}/ipt-${IPT_VERSION}.war \
    && unzip -d /usr/local/tomcat/webapps/${IPT_NAME} ipt.war \
    && rm -f ipt.war

VOLUME /srv/ipt
COPY /src/driver/mssql-jdbc-9.2.1.jre8.jar /usr/local/tomcat/webapps/ROOT/WEB-INF/lib

EXPOSE 8080
CMD ["catalina.sh", "run"]

# Example for customizing the IPT in the Docker build
# (Many approaches are possible, such as changing the CSS, about.ftl etc).
#RUN curl -LSsfo /usr/local/tomcat/webapps/${IPT_NAME}/images/BID-v2.png https://cloud.gbif.org/bid/images/BID-v2.png \
#    && perl -pi -e 's[GBIF-2015-standard-ipt.png][BID-v2.png]' /usr/local/tomcat/webapps/${IPT_NAME}/WEB-INF/pages/inc/menu.ftl
