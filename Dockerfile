FROM ubuntu:20.04
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>
#kops-kube
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt -y install software-properties-common vim pwgen unzip curl python3 python3-pip glibc-source groff less git-core jq openssl openssh-client && \
  apt clean && \
  rm -rf /var/lib/apt/lists/* \

RUN pip3 install urllib3 paramiko ncurses-term subprocess

#Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install

#Install Vault Client
RUN curl https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt -y update && apt -y install vault \

#Install Kubectl
#Tryin Installing Kubectl - Pre - requisite to install kops \
RUN apt-get install -y apt-transport-https ca-certificates \
    RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    chmod +x ./kubectl
    mv ./kubectl /usr/local/bin

#If this doesnt work just do from binary



