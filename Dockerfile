FROM ubuntu:20.04
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get -y install software-properties-common vim pwgen unzip curl python3 python-pip glibc-source groff less git-core && \
  rm -rf /var/lib/apt/lists/*
