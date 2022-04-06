FROM ubuntu:20.04
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt -y install software-properties-common vim pwgen unzip curl python3 python3-pip glibc-source groff less git-core jq openssl openssh-client && \
  apt clean && \
  rm -rf /var/lib/apt/lists/* \

ENV KOPS_VERSION=v1.23.0
# https://kubernetes.io/docs/tasks/kubectl/install/
# latest stable kubectl: curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt
ENV KUBECTL_VERSION=v1.23.0


#Install kubectl
RUN apt-get install -y apt-transport-https ca-certificates && \
    curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list \
    apt-get update \
    apt-get install kubectl

#Install kops \
RUN curl -O --location --silent --show-error https://github.com/kubernetes/kops/releases/download/${KOPS_VERSION}/kops-linux-amd64 \
    mv kops-linux-amd64 /usr/local/bin/kops \








