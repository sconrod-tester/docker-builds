FROM ubuntu:latest
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get -y install \
          software-properties-common \
          vim \
          pwgen \
          unzip \
          curl \
          python3 \
          glibc-source groff less \
          git-core && \
  pip install \
      netmiko \
      lastpass-python \
  CMD ["curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"]
  CMD ["unzip awscliv2.zip"]
  CMD ["./aws/install"]
  CMD ["export AWS_PAGER="]
  rm -rf /var/lib/apt/lists/*
