FROM ubuntu:20.04
MAINTAINER Sherri Conrod <sconrod@cisco.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt -y install software-properties-common vim pwgen unzip curl python3 python3-pip glibc-source groff less git-core jq openssl openssh-client gcc make sshpass libffi-dev libxml2-dev libxslt-dev openssl ca-certificates apt-transport-https lsb-release gnupg && \
  apt clean && \
  rm -rf /var/lib/apt/lists/* \

RUN pip3 install urllib3 netmiko ncurses-term subprocess

#Install AWS CLI

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt update && apt -y install vault \