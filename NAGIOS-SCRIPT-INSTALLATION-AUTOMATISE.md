<div align="center">

<a href="https://github.com/0xCyberLiTech">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=32&pause=1000&color=D14A4A&center=true&vCenter=true&width=650&lines=SUPERVISION+AVEC+NAGIOS;Installation+%26+Configuration;Tutoriels+%26+Fichiers+d'Exemple" alt="Typing SVG" />
</a>

<p align="center">
  <em>Tutoriels et configurations pour la supervision avec Nagios Core.</em><br>
  <b>📊 Monitoring – 📈 Performance – ⚙️ Fiabilité</b>
</p>

</div>

---

### 👨‍💻 **À propos de moi.**

> Ce dépôt constitue mon laboratoire numérique où je consigne rigoureusement mes apprentissages et expérimentations.
> Passionné par l'écosystème Linux et la cybersécurité, je documente mon parcours et mes projets sur mon GitHub.
> Vous y trouverez des guides pratiques sur la supervision (Zabbix, Nagios), la conteneurisation (Docker) et la sécurisation de serveurs Debian.
> Mon objectif : partager mes connaissances de manière claire et pédagogique.
> N'hésitez pas à y jeter un œil : https://github.com/0xcyberlitech

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,grafana,prometheus,git,vim" />
  </a>
</p>

---

### 🧭 **Script :  :**


## Ce script :

## Compile la dernière version de Nagios Core et de ses plugins.

- Configure Apache et l’utilisateur nagiosadmin.
- Est entièrement interactif (avec confirmation en début de script).
- Génère automatiquement un mot de passe pour nagiosadmin.

## Contenu du script : install-nagios.sh

```bash
nano /usr/local/install-nagios.sh
```

```bash
#!/bin/bash

set -e

clear
echo "#############################################"
echo "#       Script d'installation Nagios        #"
echo "#       Interactif & Automatisé (Debian)    #"
echo "#############################################"
echo

read -p "Souhaitez-vous continuer l'installation ? [o/N] " confirm
if [[ ! "$confirm" =~ ^[oO]$ ]]; then
  echo "Installation annulée."
  exit 1
fi

# Variables
WORKDIR="/opt/nagios"
HTPASSWD_USER="nagiosadmin"

echo "[1/10] ➤ Mise à jour du système"
apt update && apt upgrade -y

echo "[2/10] ➤ Création du répertoire de travail"
mkdir -p "$WORKDIR"
cd "$WORKDIR"

echo "[3/10] ➤ Installation des paquets nécessaires"
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
  curl \
  libmcrypt-dev \
  bc \
  gawk \
  dc \
  snmp \
  libnet-snmp-perl \
  gettext

echo "[4/10] ➤ Téléchargement de Nagios Core"
NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz
tar -xvzf $NAGIOS_VER.tar.gz
cd $NAGIOS_VER

echo "[5/10] ➤ Compilation de Nagios Core"
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
make install-groups-users
usermod -a -G nagios www-data
make install
make install-daemoninit
make install-commandmode
make install-config
make install-webconf

echo "[6/10] ➤ Activation des modules Apache"
a2enmod rewrite
a2enmod cgi

echo "[7/10] ➤ Création du compte nagiosadmin"
htpasswd -cb /usr/local/nagios/etc/htpasswd.users $HTPASSWD_USER "$(openssl rand -base64 12)"
echo "➤ Mot de passe généré automatiquement. Pensez à le modifier plus tard si besoin."

echo "[8/10] ➤ Configuration Apache"
echo 'RedirectMatch ^/$ /nagios' >> /etc/apache2/apache2.conf

echo "[9/10] ➤ Téléchargement & installation des plugins Nagios"
cd "$WORKDIR"
PLUGIN_VER=$(curl -s https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/release-//')
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$PLUGIN_VER/nagios-plugins-$PLUGIN_VER.tar.gz
tar -xvzf nagios-plugins-$PLUGIN_VER.tar.gz
cd nagios-plugins-$PLUGIN_VER
./configure
make
make install

echo "[10/10] ➤ Démarrage des services"
systemctl restart apache2.service
systemctl restart nagios.service

echo
echo "✅ Nagios est installé avec succès !"
echo "Accédez à l'interface via : http://<IP_SERVEUR>/nagios"
echo "Identifiant : $HTPASSWD_USER"
echo "Mot de passe : (celui généré automatiquement dans le fichier htpasswd)"
```

Autoriser le script à s'exécuter :

```bash
chmod +x install-nagios.sh
sudo ./install-nagios.sh
```

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>



































#!/bin/bash

set -e

clear
echo "#############################################"
echo "#       Script d'installation Nagios        #"
echo "#       Interactif & Automatisé (Debian)    #"
echo "#############################################"
echo

read -p "Souhaitez-vous continuer l'installation ? [o/N] " confirm
if [[ ! "$confirm" =~ ^[oO]$ ]]; then
  echo "Installation annulée."
  exit 1
fi

# Variables
WORKDIR="/opt/nagios"
HTPASSWD_USER="nagiosadmin"

echo "[1/10] ➤ Mise à jour du système"
apt update && apt upgrade -y

echo "[2/10] ➤ Création du répertoire de travail"
mkdir -p "$WORKDIR"
cd "$WORKDIR"

echo "[3/10] ➤ Installation des paquets nécessaires"
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
  curl \
  libmcrypt-dev \
  bc \
  gawk \
  dc \
  snmp \
  libnet-snmp-perl \
  gettext

echo "[4/10] ➤ Téléchargement de Nagios Core"
NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz
tar -xvzf $NAGIOS_VER.tar.gz
cd $NAGIOS_VER

echo "[5/10] ➤ Compilation de Nagios Core"
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
make install-groups-users
usermod -a -G nagios www-data
make install
make install-daemoninit
make install-commandmode
make install-config
make install-webconf

echo "[6/10] ➤ Activation des modules Apache"
a2enmod rewrite
a2enmod cgi

echo "[7/10] ➤ Création du compte nagiosadmin"
htpasswd -cb /usr/local/nagios/etc/htpasswd.users $HTPASSWD_USER "$(openssl rand -base64 12)"
echo "➤ Mot de passe généré automatiquement. Pensez à le modifier plus tard si besoin."

echo "[8/10] ➤ Configuration Apache"
echo 'RedirectMatch ^/$ /nagios' >> /etc/apache2/apache2.conf

echo "[9/10] ➤ Téléchargement & installation des plugins Nagios"
cd "$WORKDIR"
PLUGIN_VER=$(curl -s https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/release-//')
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$PLUGIN_VER/nagios-plugins-$PLUGIN_VER.tar.gz
tar -xvzf nagios-plugins-$PLUGIN_VER.tar.gz
cd nagios-plugins-$PLUGIN_VER
./configure
make
make install

echo "[10/10] ➤ Démarrage des services"
systemctl restart apache2.service
systemctl restart nagios.service

echo
echo "✅ Nagios est installé avec succès !"
echo "Accédez à l'interface via : http://<IP_SERVEUR>/nagios"
echo "Identifiant : $HTPASSWD_USER"
echo "Mot de passe : (celui généré automatiquement dans le fichier htpasswd)"
