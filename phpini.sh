#!/bin/bash

# --- Recebe a ação ---
acao=$1

# --- Recebe o valor da chave ---
chave=$2

# --- Recebe o valor ---
valor=$3

# --- Ambientes que serão modificados ---
ambientes=( "apache2" "cli");

# --- Versão do PHP ---
versao=`php -r "echo substr(PHP_VERSION, 0, 3);"`

i=0;
while [ $i != ${#ambientes[@]} ]
do

	# --- Arquivo php.ini ---
	arquivo_phpini="/etc/php/$versao/${ambientes[$i]}/php.ini"

	# --- Verifica se o arquivo exisre ---
	if [ -f $arquivo_phpini ]
	then

		# --- Adiciona linha no php.ini ---
		if [ "$acao" =  "add" ]
		then
			echo "${chave}=${valor}" >> $arquivo_phpini
		else 
			if [ -e $valor ]
			then
				# --- Se o valor for vazio desabilita ---
				sed -i "/^$chave =.*$/s/^/;/g" $arquivo_phpini
			else
				# --- Habilita se for válido ---
				sed -i "/^;$chave =.*$/s/^;//g" $arquivo_phpini

				# --- Modifica o valor ---
				sed -i "s,^$chave =.*$,$chave = $valor," $arquivo_phpini
			fi
		fi
	else
    		echo "$arquivo_phpini não existe"
	fi

        let i++
done
