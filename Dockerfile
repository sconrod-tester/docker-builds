FROM centos:7
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>
#your image name
#update your docker image with your required python modules and other libraries - remember to manuall increment the tag version until symantec verioning is applied
#Required to use your params file for your docker repo with creds - enter into vault too.

ENV CENTOS_FRONTEND noninteractive

RUN yum update && \
    yum install java-1.8.0-openjdk.x86_64 && \
    yum install gcc intltool gperf glib2-devel makecache systemd-libs shadow-utils.x86_64 && \
    yum clean all && \
    mkdir /opt/tomcat && \
    groupadd -r tomcat && \
    useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat && \
    curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.79/bin/apache-tomcat-8.5.79.tar.gz && \
    tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1 && \
    cd /opt/tomcat && \
    chgrp -R tomcat /opt/tomcat && \
    chmod -R g+r /opt/tomcat/conf && \
    chmod g+x /opt/tomcat/conf && \
    chown -R tomcat webapps/ work/ temp/ logs \


COPY context.xml /opt/tomcat/webapps/manager/META-INF
COPY tomcat-users.xml /opt/tomcat/conf
COPY tomcat.service /etc/systemd/system
ADD Supercar-Trader.war /opt/tomcat/webapps


EXPOSE 80
ENV HOME /root
CMD ["systemctl start tomcat"]






