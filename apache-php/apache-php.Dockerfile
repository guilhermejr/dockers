FROM ubuntu:18.04
LABEL maintainer="Guilherme Jr. <falecom@guilhermejr.net>" 
ENV DEBIAN_FRONTEND=noninteractive
ENV ACCEPT_EULA=Y
ENV TZ=America/Bahia
WORKDIR /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
EXPOSE 80
RUN \
        apt-get update && \
        apt-get install -y software-properties-common apt-utils unzip vim && \
        add-apt-repository ppa:ondrej/php -y && \
        apt-get update && \
        apt-get install composer php7.4-ldap php7.4-readline php7.4-soap php7.4-json php7.4-bcmath php7.4-curl apache2 libapache2-mod-php7.4 php7.4 php7.4-dev php7.4-xml php7.4-bz2 php7.4-cli php7.4-curl php7.4-gd php7.4-intl php7.4-mbstring php7.4-pgsql php7.4-sqlite3 php7.4-xmlrpc php7.4-zip php7.4-mysql -y --allow-unauthenticated && \
        curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
        curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
        apt-get update && \
        apt-get install -y msodbcsql17 && \
        apt-get install -y mssql-tools && \
        apt-get install unixodbc-dev && \
        pecl install sqlsrv-5.7.1preview && \
        pecl install pdo_sqlsrv-5.7.1preview && \
        printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/7.4/mods-available/sqlsrv.ini && \
        printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/7.4/mods-available/pdo_sqlsrv.ini && \
        phpenmod -v 7.4 sqlsrv pdo_sqlsrv && \
		a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
