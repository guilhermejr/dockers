FROM debian:8.11
LABEL maintainer="Guilherme Jr. <falecom@guilhermejr.net>" 
ENTRYPOINT apachectl -D FOREGROUND
EXPOSE 80
RUN \
        apt-get update && \
        apt-get install -y php5-intl php5-sqlite php5-mysql apache2 libapache2-mod-php5 apt-utils unzip vim && \
        a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf