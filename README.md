# Installation de Nagios-core & nagios-plugins sur DEBIAN 11 & 12.
# Celle-ci est effectuée depuis les sources.
## Nagios sera installé vers les dossiers suivants :
```
/usr/local/nagios/bin
/usr/local/nagios/etc
/usr/local/nagios/libexec
/usr/local/nagios/sbin
/usr/local/nagios/share
/usr/local/nagios/var
```
## Les étapes suivantes sont à réalisées :

| Cat | Etapes |
|------|------| 
| - A. | [Préparation avant l'installation de Nagios.](#préparation-avant-installation-de-nagios) |
| - B. | [Téléchargement de Nagios-core dans sa dernère version stable.](#téléchargement-de-nagios-core) |
| - C. | [Compilation de Nagios-core.](#compilation-de-Nagios-core) |
| - D. | [Téléchargement de Nagios-plugins dans sa dernère version stable.](#téléchargement-de-nagios-plugins) |
| - E. | [Compilation de Nagios-plugins.](#compilation-de-Nagios-plugins) |
| - F. | [Test de Nagios.](#test-de-Nagios) |

<a name="préparation-avant-installation-de-nagios"></a>
### - A. Se positionner vers /opt/, puis créer le sous dossier nagios.
----------------------------------------------------------------------
```
cd /opt/
mkdir nagios/
cd nagios/
pwd /opt/nagios/
```
### Mettre en place les dépots contrib et non-free dans "/etc/apt/sources.list"

### Sauvegarder le sources.list avant de le modifier.
```
cp /etc/apt/sources.list{,.back}
```
### Puis, si besoin, réactiver l'ancien sources.list
```
cp -f /etc/apt/sources.list{.back,}
```
### sources.list - ajout des dépôts contrib et non-free
```
apt install software-properties-common
add-apt-repository contrib
add-apt-repository non-free
```
### Mettre à jour les paquets
```
apt update && apt upgrade -y
```
### Installation des packages prérequis.
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
## - B. Téléchargement de Nagios-core dans sa dernère version stable.
---------------------------------------------------------------------
```
NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest|grep tag_name | cut -d '"' -f 4)
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz
```
### Extraire l'archive
```
tar -xvzf $NAGIOS_VER.tar.gz
```
<a name="compilation-de-nagios-core"></a>
## - C. Compilation de Nagios-core.
--------------------------------------------------------
```
cd $NAGIOS_VER
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
```
### Créer un utilisateur et un groupe. 
L'utilisateur www-data est également ajouté au groupe nagios.
--------------------------------------------------------
```
make install-groups-users
usermod -a -G nagios www-data
```
### Installer les binaires
Cette étape installe les fichiers binaires, les CGI et les fichiers HTML.
--------------------------------------------------------
```
make install
```
### Installer le service / le démon
Cela installe les fichiers de service ou de démon et les configure également pour démarrer automatiquement.
--------------------------------------------------------
```
make install-daemoninit
```

### Installer le mode de commande
Ceci installe et configure le fichier de commande externe.
--------------------------------------------------------
```
make install-commandmode
```
### Installer les fichiers de configuration
### Ceci installe les fichiers de configuration *SAMPLE*. 
### Ceux-ci sont nécessaires car Nagios a besoin de certains fichiers de configuration pour lui permettre de démarrer.
--------------------------------------------------------
```
make install-config
```
### Installer les fichiers de configuration Apache
### Cela installe les fichiers de configuration du serveur Web Apache et configure les paramètres Apache.
--------------------------------------------------------
```
make install-webconf
a2enmod rewrite
a2enmod cgi
```
### Conditions préalables
### Effectuez ces étapes pour installer les packages prérequis.

### Configurer le pare-feu
Vous devez autoriser le trafic entrant du port 80 sur le pare-feu local afin de pouvoir accéder à l'interface Web de Nagios Core.
```
iptables -I INPUT -p tcp --destination-port 80 -j ACCEPT
apt-get install -y iptables-persistent
Answer yes to saving existing rules
```
### Créer un compte utilisateur nagiosadmin
### Vous devrez créer un compte utilisateur Apache pour pouvoir vous connecter à Nagios.

### La commande suivante créera un compte d'utilisateur appelé nagiosadmin et vous serez invité à fournir un mot de passe pour le compte.
```
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```
Service / Daemon Commands
### Démarrer le serveur Web Apache

### Redirection root URL (/) to /nagios
```
echo 'RedirectMatch ^/$ /nagios' >> /etc/apache2/apache2.conf
systemctl restart apache2.service
```
### Start Service / Daemon
```
systemctl start nagios.service
```
### Test Nagios
### Nagios est maintenant en cours d'exécution, pour le confirmer, vous devez vous connecter à l'interface Web de Nagios.

### Faites pointer votre navigateur Web vers l'adresse IP ou le FQDN de votre serveur Nagios Core, par exemple :

http://FQDN/nagios
http://IP/nagios

Vous serez invité à entrer un nom d'utilisateur et un mot de passe. Le nom d'utilisateur est nagiosadmin (vous l'avez créé lors d'une étape précédente) et le mot de passe est celui que vous avez fourni précédemment.

Une fois connecté, l'interface de Nagios s'affiche. Félicitations, vous avez installé Nagios Core.


## Installation de nagios-plugin
### Installation des packages prérequis.
--------------------------------------------------------
```
cd $TEMP_FOLDER

### Prerequisites
### Perform these steps to install the pre-requisite packages.
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
<a name="téléchargement-de-nagios-plugins"></a>
## - D. Téléchargement de Nagios-plugind dans sa dernère version stable.
------------------------------------------------------------------------

```
VER=$(curl -s https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/release-//')
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$VER/nagios-plugins-$VER.tar.gz
```
## Extraire l'archive
```
tar xvf nagios-plugins-$VER.tar.gz
```
<a name="téléchargement-de-nagios-plugins"></a>
## - E .Compilation de Nagios-plugins.
--------------------------------------
```
cd nagios-plugins-$VER
./tools/setup
./configure
make
make install
```
## Test Plugins
## Faites pointer votre navigateur Web vers l'adresse IP ou le FQDN de votre serveur Nagios Core, par exemple :

http://10.25.5.143/nagios
http://core-013.domain.local/nagios

## Commandes service/démon
## démarrer le serveur Web Apache
```
systemctl restart apache2.service
```
## restart Service / Daemon
```
systemctl restart nagios.service
```
## Purge
```
rm -rf $TEMP_FOLDER
```
