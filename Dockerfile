FROM ubuntu:latest
MAINTAINER Sherri Conrod <devopsontap@yahoo.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt update -y &&\
    apt upgrade -y && \
    apt -y install \
            software-properties-common \
            vim \
            pwgen \
            unzip \
            curl \
            python3 \
            glibc-source groff less \
            git-core && \
    curl -s -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip && \
    rm -rf ./aws && \
    apt purge unzip -y && \
    apt purge curl -y \
    pip3 install -r requirements.txt

