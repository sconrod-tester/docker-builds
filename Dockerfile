FROM ubuntu:20.04
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>
#thousandeyes

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get -y install software-properties-common vim pwgen unzip curl python3 python-pip glibc-source groff less git-core jq openssh-client openssl make telnet && \
#Install the vault requirements \
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -    \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
  apt-get update && apt-get install vault \
  rm -rf /var/lib/apt/lists/*
