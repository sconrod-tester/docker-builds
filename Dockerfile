FROM ubuntu:20.04
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>
#thousandeyes

ENV DEBIAN_FRONTEND noninteractive

RUN apt  update && \
  apt -y install software-properties-common build-essential vim unzip curl python3 python3-pip glibc-source groff less git-core jq openssh-client openssl make telnet ncurses-term  git && \
  apt clean && \
  rm -rf /var/lib/apt/lists/* \

COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt






