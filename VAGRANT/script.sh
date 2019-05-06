#!/bin/bash

#Hacer update a los repositorios
sudo apt-get -y update

#Instalar apache

sudo apt-get -y install apache2

#Instalar MySQL y sus dependencias, tambien nos pone contraseña root para MySQL.
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password rootpass'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password rootpass'
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql

#Instalar PHP y sus dependencias
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt

#Creamos carpeta adminer
sudo mkdir /var/www/html/adminer
cd /var/www/html/adminer

#Descargar adminer
wget https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-4.3.1-mysql.php


