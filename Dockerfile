FROM phusion/baseimage:0.9.19

RUN apt-get update
RUN apt-get install -qy nodejs nodejs-legacy npm git
RUN apt-get install -qy libzmq3-dev
RUN apt-get install -qy  libboost-system1.58.0 \
                        libboost-filesystem1.58.0\
                        libboost-program-options1.58.0 \
                        libboost-chrono1.58.0 \
                        libboost-thread1.58.0

RUN apt-get update \
    && apt-get install -y -q software-properties-common \
    && add-apt-repository ppa:bitcoin/bitcoin \
    && apt-get update \
    && apt-get install -y -q \
        libdb4.8-dev \
        libevent-dev \
        libdb4.8++-dev

WORKDIR /
RUN npm install -g bitcore-dash
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
ADD dashd /dashd

# Run command with exec, not with shell
ENTRYPOINT ["/usr/local/bin/bitcored"]

