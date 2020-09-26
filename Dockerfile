FROM ubuntu:16.04

RUN \
  # install Spacecoin based on https://github.com/spaceworksco/spacecoin documentation
  apt-get update && \
  apt-get install -y nano curl build-essential dnsutils pkg-config libcurl4-gnutls-dev libc6-dev libevent-dev m4 g++-multilib autoconf libtool libncurses5-dev unzip git python zlib1g-dev wget bsdmainutils automake libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libqt4-dev libqrencode-dev libdb++-dev ntp ntpdate && \
  cd ~ && git clone https://github.com/spaceworksco/spacecoin && \
  cd spacecoin && \
  ./zcutil/fetch-params.sh && \
  ./zcutil/build.sh -j`nproc`

ADD SPACE.conf /root/SPACE.conf.default

# P2P:35592 | RPC:35593
# Only expose p2p port unless rpc is necessary.
# If exposing rpc, it's best to set `rpcallowip=` in SPACE.conf with the ip address allowed to access it.
EXPOSE 35592

VOLUME /root/.komodo/SPACE

WORKDIR /root/spacecoin

CMD \
  # restore the .komodo/SPACE folder if the volume is empty
  [ $(ls ~/.komodo/SPACE | wc -l) -ne 0 ] && \
  echo "> ~/.komodo/SPACE not empty: using existing data" || \
  echo "> ~/.komodo/SPACE is empty: using default conf" && \
  mv /root/SPACE.conf.default ~/.komodo/SPACE/SPACE.conf && \
  # run spacecoin daemon
  echo "> Running Spacecoin daemon in background >> spacecoind.log" && \
  nohup ./src/spacecoind > spacecoind.log 2>&1 & \
  # bash shell
  /bin/bash
