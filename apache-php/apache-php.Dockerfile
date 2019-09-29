FROM ubuntu:18.04
MAINTAINER Guilherme Jr.
# Não perguntar o timezone na instalação do php 7.3
ENV DEBIAN_FRONTEND=noninteractive
# Aceitar os termos do SQLServer
ENV ACCEPT_EULA=Y

#COPY . /var/www/html
WORKDIR /var/www/html
EXPOSE 80
RUN \
        apt-get update && \
        apt-get install -y software-properties-common apt-utils unzip vim && \
        add-apt-repository ppa:ondrej/php -y && \
        apt-get update && \
        apt-get install composer php7.3-ldap php7.3-readline php7.3-soap php7.3-json php7.3-bcmath php7.3-curl apache2 libapache2-mod-php7.3 php7.3 php7.3-dev php7.3-xml php7.3-bz2 php7.3-cli php7.3-curl php7.3-gd php7.3-intl php7.3-mbstring php7.3-pgsql php7.3-sqlite3 php7.3-xmlrpc php7.3-zip php7.3-mysql -y --allow-unauthenticated && \
        curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
        curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
        apt-get update && \
        apt-get install -y msodbcsql17 && \
        apt-get install -y mssql-tools && \
        apt-get install unixodbc-dev && \
        pecl install sqlsrv && \
        pecl install pdo_sqlsrv && \
        printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/7.3/mods-available/sqlsrv.ini && \
        printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/7.3/mods-available/pdo_sqlsrv.ini && \
        phpenmod -v 7.3 sqlsrv pdo_sqlsrv && \
		a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
CMD apachectl -D FOREGROUND
