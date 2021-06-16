FROM gbif/ipt

COPY jdbc.properties /usr/local/tomcat/webapps/ROOT/WEB-INF/classes
COPY mssql-jdbc-9.2.1.jre8.jar /usr/local/tomcat/webapps/ROOT/WEB-INF/lib
VOLUME /srv/ipt
EXPOSE 8080
CMD ["catalina.sh", "run"]
