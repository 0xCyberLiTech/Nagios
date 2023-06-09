#!/bin/sh

# Installation de Metaploit sur DEBIAN 11.x
# -----------------------------------------
# Prérequis avoir installé au paravant sudo

# su - root
# apt install sudo
# adduser mmalet sudo
# init 6

# METASPLOIT EST LE FRAMEWORK DE TEST D’INTRUSION LE PLUS UTILISÉ AU MONDE

# « Metasploit aide les équipes de sécurité à faire plus que simplement vérifier les vulnérabilités, gérer les évaluations de sécurité et améliorer la sensibilisation à la sécurité ; Il permet aux défenseurs de toujours garder une longueur d’avance (ou deux). » Ils disent tout cela aussi.

# Donc, en bref, c’est un ensemble d’outils qui aident les administrateurs système à tester leurs systèmes pour les vulnérabilités.

# Installation de Metasploit sur Debian 11

# Avant de commencer, mettons à jour Debian 11 vers sa dernière version. Pour ce faire, ouvrez un terminal et exécutez ces commandes.

sudo apt update
sudo apt upgrade

# Par la suite, il est nécessaire d’installer quelques paquets pour Metasploit.

sudo apt install curl unzip nmap

# Créez maintenant un dossier dédié pour stocker Metasploit. 
# Nommez-le comme vous pensez être le meilleur. Ensuite, accédez-y.

sudo mkdir msf-temp
sudo cd ./msf-temp

# Grâce à la commande curl, vous pouvez télécharger le script Metasploit. C’est l’une des meilleures façons d’installer l’outil. Cela permettra d’économiser beaucoup de temps et d’efforts.

sudo curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall

# Attribuer les autorisations appropriées au script

sudo chmod 755 ./msfinstall

# Maintenant, exécutez le script pour démarrer l’installation.

sudo ./msfinstall

# Ce script simplifie tout. Tout d’abord, ajoutez les clés GPG et le dépôt et installez Metasploit sur Debian 11 immédiatement.

# Ensuite, exécutez

sudo msfconsole

# Et pendant l’exécution, il vous sera demandé si vous voulez une nouvelle base de données, répondez 'Y'.

# Would you like to use and setup a new database (recommended)? 
# Si vous souhaitez exécuter uniquement sur localhost, désactivez le service Web

# [Would you like to init the webservice? (Not Required) [no]: 
# Vous allez maintenant commencer à configurer Metasploit pour l’utiliser. Ce processus devrait être rapide et lorsqu’il sera prêt, vous pourrez accéder à la console et l’utiliser.

# ** Welcome to Metasploit Framework Initial Setup **
#    Please answer a few questions to get started.

# Would you like to use and setup a new database (recommended)? y
# Clearing http web data service credentials in msfconsole
# Running the 'init' command for the database:
# Creating database at /home/mmalet/.msf4/db
# Creating db socket file at /tmp
# Starting database at /home/mmalet/.msf4/db...success
# Creating database users
# Writing client authentication configuration file /home/mmalet/.msf4/db/pg_hba.conf
# Stopping database at /home/mmalet/.msf4/db
# Starting database at /home/mmalet/.msf4/db...success
# Creating initial database schema
# Database initialization successful

# ** Metasploit Framework Initial Setup Complete **
