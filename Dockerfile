FROM ubuntu:20.04
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt -y install software-properties-common vim pwgen unzip curl python3 python3-pip glibc-source groff less git-core jq openssl openssh-client wget && \
  apt clean && \
  rm -rf /var/lib/apt/lists/* \

ENV KOPS_VERSION=v1.23.0
# https://kubernetes.io/docs/tasks/kubectl/install/
# latest stable kubectl: curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt
ENV KUBECTL_VERSION=v1.23.0


# install kubectl for k8s-related jobs
RUN curl -LO "https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl" \
      -o /usr/local/bin/kubectl && \
      chmod +x /usr/local/bin/kubectl

#Install vault
RUN curl -L https://releases.hashicorp.com/vault/1.10.0/vault_1.10.0_linux_amd64.zip -o /tmp/vault.zip && \
      unzip /tmp/vault.zip -d /usr/local/bin && \
      rm /tmp/vault.zip

# install helm for k8s-related jobs
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash


#Install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install


# install kops for k8s-related jobs


















