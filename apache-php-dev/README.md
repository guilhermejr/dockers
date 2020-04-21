# apache-php 7.4

## Build
```bash
$ docker build -t guilhermejr/apache-php-dev . -f apache-php-dev.Dockerfile
```

## Run
```bash
$ docker run -d --name apache-php-dev -p "80:80" -v "$(pwd):/var/www/html" guilhermejr/apache-php-dev
```

* Workdir: /var/www/html
* ubuntu: 18.04.3
* apache: 2.4.29
* Porta 80
* php: 7.4.5
* Módulos do php
    * bcmath
    * bz2
    * calendar
    * Core
    * ctype
    * curl
    * date
    * dom
    * exif
    * fileinfo
    * filter
    * ftp
    * gd
    * gettext
    * hash
    * iconv
    * intl
    * json
    * ldap
    * libxml
    * mbstring
    * mysqli
    * mysqlnd
    * openssl
    * pcntl
    * pcre
    * PDO
    * pdo_mysql
    * pdo_pgsql
    * pdo_sqlite
    * pdo_sqlsrv
    * pgsql
    * Phar
    * posix
    * readline
    * Reflection
    * session
    * shmop
    * SimpleXML
    * soap
    * sockets
    * sodium
    * SPL
    * sqlite3
    * sqlsrv
    * standard
    * sysvmsg
    * sysvsem
    * sysvshm
    * tokenizer
    * wddx
    * xml
    * xmlreader
    * xmlrpc
    * xmlwriter
    * xsl
    * Zend OPcache
    * zip
    * zlib