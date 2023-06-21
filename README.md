# Installation de Nagios-core & nagios-plugins sur DEBIAN 11 & 12.
# Celle-ci est effectuée depuis les sources.

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

### - A. préparation-avant-installation-de-nagios
####   - Création du sous dossier /opt/nagios/.
```
mkdir -p /opt/nagios
cd /opt/nagios
```
#### Mettre à jour les paquets.
```
apt update && apt upgrade -y
```
#### Conditions préalables.
#### Effectuez ces étapes pour installer les packages prérequis.
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

#### Téléchargement du noyau source de nagios.
```
NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest|grep tag_name | cut -d '"' -f 4)
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz
```
#### Extraire l'archive $NAGIOS_VER.tar.gz.
```
tar -xvzf $NAGIOS_VER.tar.gz
```
#### Compilation de Nagios-core.
```
cd $NAGIOS_VER
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
```
#### Créer un utilisateur et un groupe.
#### Cela crée l'utilisateur et le groupe nagios. L'utilisateur www-data est également ajouté au groupe nagios.
```
make install-groups-users
usermod -a -G nagios www-data
```
#### Installer les binaires.
#### Cette étape installe les fichiers binaires, les CGI et les fichiers HTML.
```
make install
```
#### Install Service / Daemon
#### Cela installe les fichiers de service ou de démon et les configure également pour démarrer automatiquement ...
```
make install-daemoninit
```
#### Install Command Mode
#### This installs and configures the external command file.
make install-commandmode

#### Install Configuration Files
#### This installs the *SAMPLE* configuration files. These are required as Nagios needs some configuration files to allow it to start.
make install-config

#### Install Apache Config Files
#### This installs the Apache web server configuration files and configures the Apache settings.
make install-webconf
a2enmod rewrite
a2enmod cgi

#### Prerequisites
#### Perform these steps to install the pre-requisite packages.

#### Configure Firewall
#### You need to allow port 80 inbound traffic on the local firewall so you can reach the Nagios Core web interface.

#iptables -I INPUT -p tcp --destination-port 80 -j ACCEPT
#apt-get install -y iptables-persistent
#### Answer yes to saving existing rules

#### Create nagiosadmin User Account
#### You'll need to create an Apache user account to be able to log into Nagios.

#### The following command will create a user account called nagiosadmin and you will be prompted to provide a password for the account.

htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

# Service / Daemon Commands
# Start Apache Web Server

# Redirect root URL (/) to /nagios
echo 'RedirectMatch ^/$ /nagios' >> /etc/apache2/apache2.conf

systemctl restart apache2.service

# Start Service / Daemon
systemctl start nagios.service

# Test Nagios
# Nagios is now running, to confirm this you need to log into the Nagios Web Interface.

# Point your web browser to the ip address or FQDN of your Nagios Core server, for example:

# http://10.25.5.143/nagios
# http://core-013.domain.local/nagios

# You will be prompted for a username and password. The username is nagiosadmin (you created it in a previous step) and the password is what you provided earlier.

# Once you have logged in you are presented with the Nagios interface. Congratulations you have installed Nagios Core.

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

# Downloading The Source
VER=$(curl -s https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/release-//')
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$VER/nagios-plugins-$VER.tar.gz

# Extract the tarball
tar xvf nagios-plugins-$VER.tar.gz

# Navigate into the new plugins folder then compile and install.
cd nagios-plugins-$VER
./tools/setup
./configure
make
make install

# Test Plugins
# Point your web browser to the ip address or FQDN of your Nagios Core server, for example:

# http://10.25.5.143/nagios
# http://core-013.domain.local/nagios

# Service / Daemon Commands
# start Apache Web Server
systemctl restart apache2.service

# restart Service / Daemon
systemctl restart nagios.service

# Purge
rm -rf $TEMP_FOLDER

# The end...




