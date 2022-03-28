FROM ubuntu:20.04
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>
#thousandeyes

ENV DEBIAN_FRONTEND noninteractive

RUN apt  update && \
  apt -y install software-properties-common vim pwgen unzip curl python3 python3-pip glibc-source groff less git-core jq openssh-client openssl make telnet && \
  rm -rf /var/lib/apt/lists/*
