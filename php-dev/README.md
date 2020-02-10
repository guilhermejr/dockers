# php 7.4

## Build
```bash
$ docker build -t guilhermejr/php-dev . -f php-dev.Dockerfile
```

## Run
```bash
$ docker run -d --name php-dev -p "80:80" -v "$(pwd):/var/www" guilhermejr/php-dev
```

* Workdir: /var/www/
* php target server: public
* ubuntu: 18.04.1
* Porta 80
* php: 7.4.2
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