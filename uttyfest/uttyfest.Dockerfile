FROM debian:8.11
LABEL maintainer="Guilherme Jr."
#WORKDIR /var/www/html
#ENTRYPOINT service apache2 start
EXPOSE 80
RUN \
        apt-get update && \
        apt-get install -y php5-intl php5-sqlite php5-mysql apache2 libapache2-mod-php5 apt-utils unzip vim && \
        a2enmod rewrite
COPY environments/production/manifests/000-default.conf /etc/apache2/sites-enabled/000-default.conf
CMD apachectl -D FOREGROUND