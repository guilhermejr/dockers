FROM ubuntu:18.04
LABEL maintainer="Guilherme Jr. <falecom@guilhermejr.net>" 
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Bahia
WORKDIR /
ENTRYPOINT /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*
EXPOSE 3142
RUN \
        apt-get update && \
        apt-get -y install apt-cacher-ng && \
        echo "PassThroughPattern: .*" >> /etc/apt-cacher-ng/acng.conf