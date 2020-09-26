FROM ubuntu:16.04

COPY ./install-packages.sh /install-packages.sh
CMD chmod 777 /install-packages.sh && chmod +x /install-packages.sh
RUN /bin/bash -c "source /install-packages.sh"

# Install Spacecoin based on https://github.com/spaceworksco/spacecoin documentation
RUN cd ~ && git clone https://github.com/spaceworksco/spacecoin && \
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
