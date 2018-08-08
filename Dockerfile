FROM ubuntu:xenial
MAINTAINER John Garza <johnegarza@wustl.edu>

LABEL \
    description="Image containing the verifyBamID program"

RUN apt-get update -y && apt-get install -y \
    apt-utils \
    build-essential \
    g++ \
    gcc-multilib \
    git \
    libssl-dev \
    zlib1g-dev

RUN cd /tmp/ && git clone https://github.com/statgen/verifyBamID.git && git clone https://github.com/statgen/libStatGen.git

RUN cd /tmp/libStatGen && git checkout tags/v1.0.14

RUN cd /tmp/verifyBamID && git checkout tags/v1.1.3 && make

RUN cp /tmp/verifyBamID/bin/verifyBamID /usr/local/bin

RUN rm -rf /tmp/verifyBamID /tmp/libStatGen
