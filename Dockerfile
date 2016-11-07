FROM phusion/baseimage:0.9.19

RUN apt-get update
RUN apt-get install -y nodejs nodejs-legacy npm git
RUN apt-get install -y libzmq3-dev
RUN apt-get install -y  libboost-system1.58.0 \
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

RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
ADD dashd /dashd
ADD config.json /config.json
ADD _run_inside.sh /run_inside.sh

#RUN npm install -g bitcore-node-dash

