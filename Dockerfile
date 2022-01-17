FROM ubuntu:20.04

RUN apt update -y &&\
    apt upgrade -y && \
    apt install curl -y && \
    apt install unzip -y && \
    apt install software-properties-common -y && \
    apt vim -y && \
    apt python3 -y && \
    apt glibc-source groff less git-core -y && \
    curl -s -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip && \
    rm -rf ./aws && \
    rm -rf /var/lib/apt/lists/*
    apt purge unzip -y && \
    apt purge curl -y

ENTRYPOINT ["aws"]

