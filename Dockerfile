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

RUN curl -O --location --silent --show-error https://github.com/kubernetes/kops/releases/download/${KOPS_VERSION}/kops-linux-amd64 && \
  mv kops-linux-amd64 /usr/local/bin/kops && \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
  mv kubectl /usr/local/bin/kubectl && \
  chmod +x /usr/local/bin/kops /usr/local/bin/kubectl && \

