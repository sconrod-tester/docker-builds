#Used for OCU Build Container for AWS CP, Python 3.6, Python Modules Required for Automating Cisco API Calls
#Add in fly??
FROM ubuntu:20.04

RUN apt-get update && \
  apt -y install software-properties-common vim pwgen unzip curl python3 python3-pip glibc-source groff less git-core jq openssl openssh-client liblzo2-dev libblkid-dev e2fslibs-dev pkg-config libz-dev && \
  apt clean && \
  rm -rf /var/lib/apt/lists/* \

RUN pip3 install urllib3 paramiko ncurses-term subprocess

# base dependencies + jq
RUN apt -y update && \
apt -y install -y apt-transport-https ca-certificates gnupg

#Install AWS CLI

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install

# install kubectl for k8s-related jobs
RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
-o /usr/local/bin/kubectl && \
chmod +x /usr/local/bin/kubectl

#Install vault client

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
apt update && apt -y install vault \
rm -rf /var/lib/apt/lists/* \



