#!/bin/bash

#Make sure the script is being executed with superuser privileges
	if ! [ $(id -u) = 0 ];
	then
		echo "No soc root"
	exit 1
	fi

#Comprobamos que ha introducido user name
	if [ -z $1 ]
	then
		echo "No has definit un usuari"
	exit 1
	fi

#Generate password

PASSWORD=`cat /dev/urandom | tr -dc 'az09' | fold -w 8 | head -n1`

echo La teva contrasenya serà:$PASSWORD

#Create the user
	useradd -m $2 -c $1 -p $(openssl passwd $PASSWORD)


#Check if the useradd command succeeded
	if [ $? -ne 0 ]
	 then
   	 echo "No s'ha creat correctament el usuari."
	exit 1
	fi

#Check if the passwd command succeeded
	if [ $? -ne 0 ]
	 then
	 echo "La contrasenya no s'ha establert correctament."
	exit 1
	fi

#Change password on the first login
passwd -e $2


HOSTNAME=`hostname`
#Display the username, password, and the host where the user was created.
	echo '-----------------------------------------'
	echo 'Les dades introduïdes son les seguents:'
	echo '-----------------------------------------'
	echo ''
	echo 'El teu user name es: ' $2
	echo 'La teva passwd es: '$PASSWORD
	echo 'I el host es:' $HOSTNAME
	echo ''
	echo '-----------------------------------------'
