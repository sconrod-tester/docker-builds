FROM tomcat:8.0-alpine
ADD Supercar-Trader.war /usr/local/tomcat/webapps/
COPY ./context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
COPY ./tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml
EXPOSE 8080
CMD [“catalina.sh”, “run”]