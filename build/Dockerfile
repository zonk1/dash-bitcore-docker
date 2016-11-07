# Dockerfile for bitcore-dash-insight
FROM phusion/baseimage:0.9.19
MAINTAINER moocowmoo <moocowmoo@dash.org>
LABEL description="Build dash"

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# update base
RUN apt-get update \
    && apt-get upgrade -y -q \
    && apt-get install -y -q \
        build-essential \
        curl \
        git \
        libzmq3-dev \
        python2.7 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && ln -s /usr/bin/python2.7 /usr/bin/python

# install dashd 12.1 compile prerequisites
RUN apt-get update \
    && apt-get install -y -q software-properties-common \
    && add-apt-repository ppa:bitcoin/bitcoin \
    && apt-get update \
    && apt-get install -y -q \
        automake \
        autotools-dev \
        bsdmainutils \
        build-essential \
        libboost-all-dev \
        libdb4.8-dev \
        libdb4.8++-dev \
        libevent-dev \
        libssl-dev \
        libtool \
        pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# compile dashd 12.1
RUN cd /tmp  && git clone https://github.com/snogcel/dash -b v0.12.1.x
RUN cd /tmp/dash && git reset --hard d368bc84c84209ef27281bea32c30f0df890490c
RUN cd /tmp/dash && ./autogen.sh
RUN cd /tmp/dash && ./configure
RUN cd /tmp/dash && make
