FROM centos:7
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>
#your image name
#update your docker image with your required python modules and other libraries - remember to manuall increment the tag version until symantec verioning is applied
#Required to use your params file for your docker repo with creds - enter into vault too.

ENV CENTOS_FRONTEND noninteractive

RUN yum -y install java-1.8.0-openjdk.x86_64; yum clean all
RUN yum -y install git; yum clean all
RUN yum -y install vim; yum clean all
RUN mkdir /opt/tomcat && \
    groupadd -r tomcat && \
    useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat && \
    curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.79/bin/apache-tomcat-8.5.79.tar.gz && \
    tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1 && \
    cd /opt/tomcat && \
    chgrp -R tomcat /opt/tomcat && \
    chmod -R g+r /opt/tomcat/conf && \
    chmod g+x /opt/tomcat/conf && \
    chown -R tomcat webapps && \
    chown -R tomcat work && \
    chown -R tomcat temp && \
    chown -R tomcat logs


RUN git clone https://github.com/sherifadel90/AppDynamics-SupercarsJavaApp.git

CMD ["/opt/tomcat/bin/catalina.sh" , "stop"]
RUN del /opt/tomcat/webapps/manager/META-INF/context.xml

COPY Supercar-Trader.war /opt/tomcat/webapps/Supercar-Trader.war
COPY tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml
COPY context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
COPY context.xml /opt/tomcat/webapps/host-manager/META-INF/context.xml
COPY tomcat.service /etc/systemd/system/tomcat.service


CMD ["/opt/tomcat/bin/catalina.sh" , "run"]
EXPOSE 8080





