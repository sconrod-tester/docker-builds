FROM centos:7
MAINTAINER sconrod@cisco.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN yum -y update
RUN yum -y install java-1.8.0-openjdk.x86_64
RUN groupadd tomcat
RUN useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.79/bin/apache-tomcat-8.5.79-deployer.tar.gz
RUN tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1


RUN cd /opt/tomcat
RUN chgrp -R tomcat /opt/tomcat
RUN mkdir /opt/tomcat/conf
RUN chmod -R g+r /opt/tomcat/conf
RUN chmod g+x /opt/tomcat/conf
RUN mkdir webapps/ work/ temp/ logs/
RUN chown -R tomcat webapps/ work/ temp/ logs/


ADD ./context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
ADD ./tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml
ADD ./tomcat-service /etc/systemd/system/tomcat.service


EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run", "systemctl daemon-reload", "systemctl start tomcat"]

