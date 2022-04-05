FROM ubuntu:20.04
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>
#kops-kube

ENV DEBIAN_FRONTEND noninteractive

#Used for OCU Build Container for AWS CP, Python 3.6, Python Modules Required for Automating Cisco API Calls
#Add in fly??

RUN apt-get -y update && \
apt-get -y install liblzo2-dev libblkid-dev e2fslibs-dev pkg-config libz-dev curl curl vim tree unzip

# base dependencies + jq
RUN apt-get update && \
apt-get install -y apt-transport-https ca-certificates gnupg software-properties-common curl jq

COPY dumb-init/dumb-init_*_x86_64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

#Install AWS CLI

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install

#install hashicorp vault client
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt -y update && apt -y install vault \

# install Terraform, ssh and jq for bin-smoke
RUN curl -fsSL https://releases.hashicorp.com/terraform/0.14.5/terraform_0.14.5_linux_amd64.zip -o /tmp/terraform.zip && \
unzip /tmp/terraform.zip -d /usr/local/bin && \
rm /tmp/terraform.zip
RUN apt-get update && apt-get -y install jq openssh-client libnss3-tools

# install kubectl for k8s-related jobs
RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
-o /usr/local/bin/kubectl && \
chmod +x /usr/local/bin/kubectl

# add fly executables
RUN mkdir /usr/local/concourse/fly-assets
COPY fly-linux/fly-*.tgz /usr/local/concourse/fly-assets
COPY fly-windows/fly-*.zip /usr/local/concourse/fly-assets
COPY fly-darwin/fly-*.tgz /usr/local/concourse/fly-assets

# set $PATH for convenience
ENV PATH /usr/local/concourse/bin:${PATH}


