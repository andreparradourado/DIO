#!/bin/bash

echo "INICIANDO SCRIPT."

echo "ATUALIZANDO SERVIDOR..."
apt-get update -y
apt-get upgrade -y

echo "BAIXANDO E INSTALANDO UNZIP E SERVIÇO APACHE2..."
apt-get install apache2 -y
apt-get install unzip -y

echo "BAIXANDO E DESCOMPACTANDO ARQUIVOS DA APLICAÇÃO..."
wget -P /tmp/ https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip /tmp/main.zip -d /tmp/
cp -R /tmp/linux-site-dio-main/* /var/www/html/
aen2mod rewrite
service apache2 restart

echo "SCRIPT FINALIZADO."
