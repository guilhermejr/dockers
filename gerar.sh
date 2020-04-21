#!/bin/bash

# --- Cria a rede local ---
docker network create -d bridge rede

# --- Cria o apt-cacher ---
docker run -d -p 3142:3142 --network rede --name cacher guilhermejr/apt-cacher bash

# --- Versão do PHP ---
VERSAOPHP=7.4

# --- Apaga as imagens ---
docker rmi guilhermejr/apache-php
docker rmi guilhermejr/apache-php:${VERSAOPHP}
docker rmi guilhermejr/apache-php-dev
docker rmi guilhermejr/apache-php-dev:${VERSAOPHP}
docker rmi guilhermejr/php
docker rmi guilhermejr/php:${VERSAOPHP}
docker rmi guilhermejr/php-dev
docker rmi guilhermejr/php-dev:${VERSAOPHP}
docker rmi guilhermejr/php-cli
docker rmi guilhermejr/php-cli:${VERSAOPHP}
docker rmi guilhermejr/php-cli-dev
docker rmi guilhermejr/php-cli-dev:${VERSAOPHP}
docker rmi guilhermejr/laravel
docker rmi guilhermejr/laravel:${VERSAOPHP}
docker rmi guilhermejr/laravel-dev
docker rmi guilhermejr/laravel-dev:${VERSAOPHP}

# --- Cria as imagens ---
docker build --network rede -t guilhermejr/apache-php -f apache-php/apache-php.Dockerfile apache-php
docker build --network rede -t guilhermejr/apache-php:${VERSAOPHP} -f apache-php/apache-php.Dockerfile apache-php
docker build --network rede -t guilhermejr/apache-php-dev -f apache-php-dev/apache-php-dev.Dockerfile apache-php-dev
docker build --network rede -t guilhermejr/apache-php-dev:${VERSAOPHP} -f apache-php-dev/apache-php-dev.Dockerfile apache-php-dev
docker build --network rede -t guilhermejr/php -f php/php.Dockerfile php
docker build --network rede -t guilhermejr/php:${VERSAOPHP} -f php/php.Dockerfile php
docker build --network rede -t guilhermejr/php-dev -f php-dev/php-dev.Dockerfile php-dev
docker build --network rede -t guilhermejr/php-dev:${VERSAOPHP} -f php-dev/php-dev.Dockerfile php-dev
docker build --network rede -t guilhermejr/php-cli -f php-cli/php-cli.Dockerfile php-cli
docker build --network rede -t guilhermejr/php-cli:${VERSAOPHP} -f php-cli/php-cli.Dockerfile php-cli
docker build --network rede -t guilhermejr/php-cli-dev -f php-cli-dev/php-cli-dev.Dockerfile php-cli-dev
docker build --network rede -t guilhermejr/php-cli-dev:${VERSAOPHP} -f php-cli-dev/php-cli-dev.Dockerfile php-cli-dev
docker build --network rede -t guilhermejr/laravel -f laravel/laravel.Dockerfile laravel
docker build --network rede -t guilhermejr/laravel:${VERSAOPHP} -f laravel/laravel.Dockerfile laravel
docker build --network rede -t guilhermejr/laravel-dev -f laravel-dev/laravel-dev.Dockerfile laravel-dev
docker build --network rede -t guilhermejr/laravel-dev:${VERSAOPHP} -f laravel-dev/laravel-dev.Dockerfile laravel-dev

# --- Sobe as imagens ---
docker push guilhermejr/apache-php
docker push guilhermejr/apache-php:${VERSAOPHP}
docker push guilhermejr/apache-php-dev
docker push guilhermejr/apache-php-dev:${VERSAOPHP}
docker push guilhermejr/php
docker push guilhermejr/php:${VERSAOPHP}
docker push guilhermejr/php-dev
docker push guilhermejr/php-dev:${VERSAOPHP}
docker push guilhermejr/php-cli
docker push guilhermejr/php-cli:${VERSAOPHP}
docker push guilhermejr/php-cli-dev
docker push guilhermejr/php-cli-dev:${VERSAOPHP}
docker push guilhermejr/laravel
docker push guilhermejr/laravel:${VERSAOPHP}
docker push guilhermejr/laravel-dev
docker push guilhermejr/laravel-dev:${VERSAOPHP}

# --- Remove apt-cacher ---
docker rm -f cacher

# --- Remove a rede local ---
docker network rm rede