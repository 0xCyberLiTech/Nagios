# Installation de Nagios-core & nagios-plugins depuis les sources.
# Nagios sera installé vers les dossiers suivants :
```
/usr/local/nagios/bin
/usr/local/nagios/etc
/usr/local/nagios/libexec
/usr/local/nagios/sbin
/usr/local/nagios/share
/usr/local/nagios/var
```
# Les étapes suivantes sont à réalisées :

| Cat | Thème |
|------|------| 
| - A. | [Présentation de Nagios.](#présentation-de-nagios) |
| - B. | [Préparation avant l'installation de Nagios.](#préparation-avant-installation-de-nagios) |
| - C. | [Téléchargement de Nagios-core dans sa dernère version stable.](#téléchargement-de-nagios-core) |
| - D. | [Compilation de Nagios-core.](#compilation-de-Nagios-core) |
| - E. | [Mise à jour manuelle de Portainer.](#mise-à-jour-manuelle-de-portainer) |
| - F. | [Mise à jour automatisée de Portainer.](#mise-à-jour-automatisée-de-portainer) |

<a name="préparation-avant-installation-de-nagios"></a>
Présentation de Nagios.
--------------------------------------------------------




<a name="préparation-avant-installation-de-nagios"></a>
## Se positionner vers /opt/, puis créer le sous dossier nagios.

```
cd /opt/
mkdir nagios/
cd nagios/
pwd /opt/nagios/
```
## Conditions préalables.
## Installation des packages prérequis.
--------------------------------------------------------
```
apt install -y \
       autoconf \
       build-essential \
       gcc \
       libc6 \
       make \
       wget \
       unzip \
       apache2 \
       apache2-utils \
       libapache2-mod-php \
       php \
       php-gd \
       libgd-dev \
       openssl \
       libssl-dev \
       curl
```
<a name="téléchargement-de-nagios-core"></a>
## Téléchargement de Nagios-core dans sa dernère version stable.
--------------------------------------------------------
```
NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest|grep tag_name | cut -d '"' -f 4)
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz
```
## Extraire l'archive
```
tar -xvzf $NAGIOS_VER.tar.gz
```
<a name="compilation-de-nagios-core"></a>
## Compilation
--------------------------------------------------------
```
cd $NAGIOS_VER
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
```
## Créer un utilisateur et un groupe
Cela crée l'utilisateur et le groupe nagios. 
L'utilisateur www-data est également ajouté au groupe nagios.
--------------------------------------------------------
```
make install-groups-users
usermod -a -G nagios www-data
```
## Installer les binaires
Cette étape installe les fichiers binaires, les CGI et les fichiers HTML.
--------------------------------------------------------
```
make install
```
## Installer le service / le démon
Cela installe les fichiers de service ou de démon et les configure également pour démarrer automatiquement.
--------------------------------------------------------
```
make install-daemoninit
```

## Installer le mode de commande
Ceci installe et configure le fichier de commande externe.
--------------------------------------------------------
```
make install-commandmode
```
## Installer les fichiers de configuration
### Ceci installe les fichiers de configuration *SAMPLE*. 
### Ceux-ci sont nécessaires car Nagios a besoin de certains fichiers de configuration pour lui permettre de démarrer.
--------------------------------------------------------
```
make install-config
```
## Installer les fichiers de configuration Apache
### Cela installe les fichiers de configuration du serveur Web Apache et configure les paramètres Apache.
--------------------------------------------------------
```
make install-webconf
a2enmod rewrite
a2enmod cgi
```
## Conditions préalables
## Effectuez ces étapes pour installer les packages prérequis.

## Configurer le pare-feu
Vous devez autoriser le trafic entrant du port 80 sur le pare-feu local afin de pouvoir accéder à l'interface Web de Nagios Core.
```
iptables -I INPUT -p tcp --destination-port 80 -j ACCEPT
apt-get install -y iptables-persistent
Answer yes to saving existing rules
```
## Créer un compte utilisateur nagiosadmin
### Vous devrez créer un compte utilisateur Apache pour pouvoir vous connecter à Nagios.

### La commande suivante créera un compte d'utilisateur appelé nagiosadmin et vous serez invité à fournir un mot de passe pour le compte.
```
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```
Service / Daemon Commands
### Démarrer le serveur Web Apache

## Redirection root URL (/) to /nagios
```
echo 'RedirectMatch ^/$ /nagios' >> /etc/apache2/apache2.conf
systemctl restart apache2.service
```
## Start Service / Daemon
```
systemctl start nagios.service
```
## Test Nagios
### Nagios est maintenant en cours d'exécution, pour le confirmer, vous devez vous connecter à l'interface Web de Nagios.

### Faites pointer votre navigateur Web vers l'adresse IP ou le FQDN de votre serveur Nagios Core, par exemple :

http://10.25.5.143/nagios
http://core-013.domain.local/nagios

You will be prompted for a username and password. The username is nagiosadmin (you created it in a previous step) and the password is what you provided earlier.

Once you have logged in you are presented with the Nagios interface. Congratulations you have installed Nagios Core.

```
cd $TEMP_FOLDER

# Prerequisites
# Perform these steps to install the pre-requisite packages.
apt install -y \
       autoconf \
       gcc \
       libc6 \
       libmcrypt-dev \
       make \
       libssl-dev \
       wget \
       bc \
       gawk \
       dc \
       build-essential \
       snmp \
       libnet-snmp-perl \
       gettext
```
Downloading The Source
```
VER=$(curl -s https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/release-//')
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$VER/nagios-plugins-$VER.tar.gz
```
Extract the tarball
```
tar xvf nagios-plugins-$VER.tar.gz
```
Navigate into the new plugins folder then compile and install.
```
cd nagios-plugins-$VER
./tools/setup
./configure
make
make install
```
Test Plugins
Point your web browser to the ip address or FQDN of your Nagios Core server, for example:

http://10.25.5.143/nagios
http://core-013.domain.local/nagios

Service / Daemon Commands
start Apache Web Server
```
systemctl restart apache2.service
```
restart Service / Daemon
```
systemctl restart nagios.service
```
Purge
```
rm -rf $TEMP_FOLDER
```
# The end...
