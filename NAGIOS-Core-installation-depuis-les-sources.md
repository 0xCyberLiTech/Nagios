![Nagios](./images/nagios.png)

## NAGIOS CORE installation depuis les sources dans sa dernière version :

Création du sous dossier /opt/nagios/.
```
mkdir -p /opt/nagios/
```
```
cd /opt/nagios
```
Mettre à jour les paquets.
```
apt update && apt upgrade -y
```
- Installation de Nagios-core dans sa dernière version stable.
- Conditions préalables.
- Installer les packages prérequis.
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
## - Téléchargement des sources de Nagios-core dans sa dernère version stable.
```
NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest|grep tag_name | cut -d '"' -f 4)
```
```
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz
```
- Extraire l'archive $NAGIOS_VER.tar.gz.
```
tar -xvzf $NAGIOS_VER.tar.gz
```
## - Compilation depuis les sources de Nagios-core.
```
cd $NAGIOS_VER
```
```
./configure --with-httpd-conf=/etc/apache2/sites-enabled
```
```
make all
```
- Créer un utilisateur et un groupe.
Cela crée l'utilisateur et le groupe nagios. L'utilisateur www-data est également ajouté au groupe nagios.
```
make install-groups-users
```
```
usermod -a -G nagios www-data
```
- Installer les binaires.
Cette étape installe les fichiers binaires, les CGI et les fichiers HTML.
```
make install
```
- Install Service / Daemon.
Cela installe les fichiers de service ou de deamon et les configure également pour démarrer automatiquement ...
```
make install-daemoninit
```
- Installation Command Mode.
Ceci installe et configure le fichier de commande externe.
```
make install-commandmode
```
- Installer les fichiers de configuration.
Ceci installe les fichiers de configuration *SAMPLE*. Ceux-ci sont nécessaires car Nagios a besoin de certains fichiers de configuration pour lui permettre de démarrer.
```
make install-config
```
- Installer les fichiers de configuration Apache.
Cela installe les fichiers de configuration du serveur Web Apache et configure les paramètres Apache.
```
make install-webconf
```
```
a2enmod rewrite
```
```
a2enmod cgi
```
- Configurer le pare-feu.
Vous devez autoriser le trafic entrant du port 80 sur le pare-feu local afin de pouvoir accéder à l'interface Web de Nagios Core.
```
#iptables -I INPUT -p tcp --destination-port 80 -j ACCEPT
#apt-get install -y iptables-persistent
```
Répondre oui à l'enregistrement des règles existantes.

- Créer un compte utilisateur nagiosadmin.
Vous devrez créer un compte utilisateur Apache pour pouvoir vous connecter à Nagios.
La commande suivante créera un compte d'utilisateur appelé nagiosadmin et vous serez invité à fournir un mot de passe pour le compte.
```
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```
- Commandes service / deamon
Redirect root URL (/$) to /nagios
Démarrer le serveur Web Apache2.
```
echo 'RedirectMatch ^/$ /nagios' >> /etc/apache2/apache2.conf
```
```
systemctl start apache2.service
```
Démarrer Service / Daemon Nagios.
```
systemctl start nagios.service
```
- Test d'accès à Nagios.
Nagios est maintenant en cours d'exécution, pour le confirmer, vous devez vous connecter à l'interface Web de Nagios.
Faites pointer votre navigateur Web vers l'adresse IP ou le FQDN de votre serveur Nagios Core, par exemple :
```
http://mon-ip/nagios
http://FQDN/nagios
```
Vous serez invité à entrer un nom d'utilisateur et un mot de passe. Le nom d'utilisateur est nagiosadmin (vous l'avez créé lors d'une étape précédente) et le mot de passe est celui que vous avez fourni précédemment.
Une fois connecté, l'interface de Nagios s'affiche. Félicitations, vous avez installé Nagios Core.


## NAGIOS-PLUGINS installation depuis les sources dans sa dernière version :

- Conditions préalables.
- Installer les packages prérequis.
```
cd /opt/nagios/
```
```
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
## - Téléchargement des sources de nagios-plugins dans sa dernère version stable.

```
VER=$(curl -s https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/release-//')
```
```
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$VER/nagios-plugins-$VER.tar.gz
```
Ci les liens ci-dessus ne fonctionnent pas utiliser la méthode suivante pour récupérer la dernièere version de nagios-plugins :

- Identifier la dernière version stable accessible depuis l'url suivante :

https://nagios-plugins.org/download/

En l'occurrence la 2.4.8 à ce jour (21-02-2024).
```
VER=2.4.8
```
```
wget https://nagios-plugins.org/download/nagios-plugins-$VER.tar.gz
```
Une fois l'archive récupérée décompreser celle-ci :
```
tar -xvzf nagios-plugins-${VER}.tar.gz
```
## - Compilation depuis les sources de nagios-plugins.
```
cd nagios-plugins-$VER
```
Facultatif concernant la commande suivante (./tools/setup):
```
./tools/setup
```
```
./configure
```
```
make
```
```
make install
```
## - Tester à nouveau Nagios.
Faites pointer votre navigateur Web vers l'adresse IP ou le FQDN de votre serveur Nagios Core, par exemple :
```
http://mon-ip/nagios
http://FQDN/nagios
```
Avec les différents fichiers de configuration présentés en guise d'exemple, notre map Nagios ressemblera à ça.
Décommenté la variable 'parents' dans les fichiers de configuration donnés en exemple.

![Map_Nagios](./images/nagios_map.png)
![Nagios_Host_Groups](./images/nagios_service_Host_Groups.png)

- Redémarrer / Daemon Apache2.
- Redémarrer le serveur Web Apache.
```
systemctl restart apache2.service
```
Redémarrer / Daemon Nagios.
```
systemctl restart nagios.service
```
Purge.
```
rm -rf $TEMP_FOLDER
```
## - Installation automatisée de Nagios-core & plugins-nagios.

Via un fichier bash.
[Disponible ici](install-nagios.sh)
```
touch install-nagios.sh
```
```
chmod +x install-nagios.sh
```
```
sudo ./install-nagios.sh
```
