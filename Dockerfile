FROM ubuntu:20.04
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>
#Kops Image

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt -y install software-properties-common vim pwgen unzip curl python3 python3-pip glibc-source groff less git-core jq openssl openssh-client apt-transport-https ca-certificates curl && \
  apt clean && \
  rm -rf /var/lib/apt/lists/* \

RUN pip3 install urllib3 paramiko ncurses-term subprocess

#Install AWS CLI

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64 \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list \
    apt -y update \
    unzip awscliv2.zip && \
    ./aws/install \
    chmod +x kops \
    mv kops /usr/local/bin/kops \

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt update && apt -y install vault \
