FROM ubuntu:22
MAINTAINER X <xarzoa@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /xmrig/app

RUN \
  apt-get update && \
  apt-get upgrade
  
RUN \
  sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
  
RUN \
  git clone https://github.com/xmrig/xmrig.git \
  mkdir xmrig/build && cd xmrig/build \
  cmake .. \
  make -j$(nproc)
  
COPY config.json

CMD ["sudo", "./xmrig"]