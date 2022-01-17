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
  rm -rf /var/lib/apt/lists/*
  curl -s -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip && \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -rf awscliv2.zip && \
  rm -rf ./aws && \
  apt-get purge unzip -y && \
  apt-get purge curl -y \
  pip install -r requirements.txt

