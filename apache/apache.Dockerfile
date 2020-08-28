FROM ubuntu:latest
LABEL maintainer="Guilherme Jr. <falecom@guilhermejr.net>" 
ENV DEBIAN_FRONTEND=noninteractive
ENV ACCEPT_EULA=Y
ENV TZ=America/Bahia
WORKDIR /etc/apache2
ENTRYPOINT apachectl -D FOREGROUND
EXPOSE 80 443
RUN \
        apt-get update && \
        apt-get install -y software-properties-common apt-utils unzip vim apache2 certbot python3-certbot-apache && \
	a2enmod rewrite ssl proxy proxy_http && \
        service apache2 restart