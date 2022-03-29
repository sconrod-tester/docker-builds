FROM ubuntu:20.04
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>
#thousandeyes

ENV DEBIAN_FRONTEND noninteractive

RUN apt  update && \
  apt -y install software-properties-common build-essential vim unzip curl python3 python3-pip glibc-source groff less git-core jq openssh-client openssl make telnet ncurses-term  git && \
  apt clean && \
  rm -rf /var/lib/apt/lists/* \

RUN pip3 install urllib3 paramiko ncurses-term subprocess

COPY dumb-init/dumb-init_*_x86_64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init






