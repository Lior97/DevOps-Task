FROM jenkins/inbound-agent

USER root 

RUN apt-get update && apt-get install -y \
    openssl \
    libtool \
    autoconf \
    libpsl-dev \
    make \
    python3 \
    libssl-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]

