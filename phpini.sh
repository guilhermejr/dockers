#!/bin/bash

# --- Recebe o valor da chave ---
chave=$1

# --- Recebe o valor ---
valor=$2

# --- Ambientes que ser√o modificados ---
ambientes=( "apache2" "cli");

# --- Vers√o do PHP ---
versao=`php -r "echo substr(PHP_VERSION, 0, 3);"`

i=0;
while [ $i != ${#ambientes[@]} ]
do

	# --- Arquivo php.ini ---
	arquivo_phpini="/etc/php/$versao/${ambientes[$i]}/php.ini"

	# --- Verifica se o arquivo exisre ---
	if [ -f $arquivo_phpini ]
	then
		if [ -e $valor ]
   	 	then
        		# --- Se o valor for vazio desabilita ---
        		sed -i "/^$chave =.*$/s/^/;/g" $arquivo_phpini
    		else
        		# --- Habilita se for v√°lido ---
        		sed -i "/^;$chave =.*$/s/^;//g" $arquivo_phpini

        		# --- Modifica o valor ---
        		sed -i "s,^$chave =.*$,$chave = $valor," $arquivo_phpini
    		fi

	else
    		echo "$arquivo_phpini não existe"
	fi

        let i++
done
