FROM ubuntu:jammy
MAINTAINER X <xarzoa@gmail.com>

WORKDIR /xmrig/app

RUN \
  apt-get update && \
  apt-get upgrade
  
RUN \
  apt-get -y install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
  
RUN \
  git clone https://github.com/xmrig/xmrig.git \
  mkdir xmrig/build && cd xmrig/build \
  cmake .. \
  make -j$(nproc)
  
COPY config.json ./

CMD ["./xmrig"]
