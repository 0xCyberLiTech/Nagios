<div align="center">
  
  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3ESUPERVISION+NAGIOS_" alt="Titre dynamique SUPERVISION NAGIOS" />
  </a>
  
  <br></br>
  
  <p align="center">
    <em>Tutoriels et configurations pour la supervision avec Nagios Core.</em><br>
    <b>📊 Monitoring – 📈 Performance – ⚙️ Fiabilité</b>
  </p>
  
  <p align="center">
    <a href="https://0xcyberlitech.github.io/">
      <img src="https://img.shields.io/badge/Portfolio-0xCyberLiTech-181717?logo=github&style=flat-square" alt="🌐 Portfolio" />
    </a>
    <a href="https://github.com/0xCyberLiTech">
      <img src="https://img.shields.io/badge/Profil-GitHub-181717?logo=github&style=flat-square" alt="🔗 Profil GitHub" />
    </a>
    <a href="https://github.com/0xCyberLiTech/Nagios/releases/latest">
      <img src="https://img.shields.io/github/v/release/0xCyberLiTech/Nagios?label=version&style=flat-square&color=blue" alt="📦 Dernière version" />
    </a>
    <a href="https://github.com/0xCyberLiTech/Nagios/blob/main/CHANGELOG.md">
      <img src="https://img.shields.io/badge/📄%20Changelog-Nagios-blue?style=flat-square" alt="📄 CHANGELOG Nagios" />
    </a>
    <a href="https://github.com/0xCyberLiTech?tab=repositories">
      <img src="https://img.shields.io/badge/Dépôts-publics-blue?style=flat-square" alt="📂 Dépôts publics" />
    </a>
    <a href="https://github.com/0xCyberLiTech/Nagios/graphs/contributors">
      <img src="https://img.shields.io/badge/👥%20Contributeurs-cliquez%20ici-007ec6?style=flat-square" alt="👥 Contributeurs Nagios" />
    </a>
  </p>

</div>

---

### 👨‍💻 **À propos de moi**

> Bienvenue sur le dépôt <strong>0xCyberLiTech</strong>, votre laboratoire numérique pour l'<strong>apprentissage</strong> et la <strong>vulgarisation</strong> de la <strong>cybersécurité</strong>, de l'<strong>administration Linux Debian</strong> et de la <strong>sécurité informatique</strong>.
> Passionné par <strong>Linux</strong>, la <strong>cryptographie</strong>, la <strong>supervision réseau</strong> et les <strong>systèmes sécurisés</strong>, je partage ici des <strong>tutoriels</strong>, <strong>guides pratiques</strong>, <strong>fiches techniques</strong> et <strong>retours d'expérience</strong> pour renforcer vos compétences IT.
>
> 🎯 <strong>Objectif :</strong> Offrir un contenu structuré, accessible et optimisé pour le référencement naturel, destiné aux étudiants, professionnels, administrateurs système, experts en sécurité et curieux du monde numérique.

<p align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="420">
  </a>
</p>

---

### 🎯 **Objectif de ce dépôt.**

> Ce dépôt a pour vocation de centraliser un ensemble de notions clés en supervision informatique. Il s’adresse aux passionnés, étudiants et professionnels souhaitant mieux comprendre les enjeux de la
> surveillance des systèmes d'information, apprendre à mettre en place des outils de monitoring efficaces et se familiariser avec les concepts et bonnes pratiques pour maintenir la performance et la stabilité de
> leurs environnements IT.

---

### 🧭 Installation automatisée de Nagios Core (Debian 12).

### 🔧 Présentation :

- Ce script Bash permet une installation complète, interactive et automatisée de Nagios Core ainsi que de ses plugins, avec :
- Téléchargement des dernières versions depuis GitHub
- Compilation et configuration automatique
- Configuration Apache
- Création de l’utilisateur nagiosadmin avec mot de passe aléatoire affiché
- Compatible Debian 12

### 📜 Pré-requis :

- Système : Debian 12
- Exécution : en tant que root

### 🛠️ Lancer le script.

#### ✅ 1) - Créer un fichier :

```bash
nano /usr/local/install-nagios.sh
```

#### ✅ 2) - Coller le contenu suivant :

```bash
#!/bin/bash

set -e

# Vérification des privilèges root
if [[ "$EUID" -ne 0 ]]; then
  echo "❌ Ce script doit être exécuté en tant que root."
  exit 1
fi

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

echo "[7/10] ➤ Création du compte nagiosadmin avec mot de passe généré"
NAGIOS_PASS=$(openssl rand -base64 12)
htpasswd -cb /usr/local/nagios/etc/htpasswd.users $HTPASSWD_USER "$NAGIOS_PASS"
echo "➤ Mot de passe généré automatiquement : $NAGIOS_PASS"

echo "[8/10] ➤ Configuration Apache : redirection vers /nagios"
echo 'RedirectMatch ^/$ /nagios' > /etc/apache2/conf-available/nagios-redirect.conf
a2enconf nagios-redirect

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
echo "Mot de passe : $NAGIOS_PASS"
```

#### ✅ 3) - Rendre le script exécutable :

```bash
chmod +x install-nagios.sh
```

```bash
sudo ./install-nagios.sh
```

#### ✅ 4) - Lancer le script :

```bash
./install_nagios.sh
```

#### 🧪 Exemple de sortie finale :

```
✅ Nagios est installé avec succès !
Accédez à l'interface via : http://192.168.1.100/nagios
Identifiant : nagiosadmin
Mot de passe : Gs8JkLzQ29Pz
```

#### 🧯 Dépannage :

- Si Apache ne démarre pas : vérifier /etc/apache2/apache2.conf, les permissions, et la syntaxe des fichiers conf.
- Si l’interface web ne répond pas :
- Vérifier que le pare-feu autorise le port 80 (ufw allow 80)
- Vérifier que le module CGI est bien activé (a2enmod cgi)
- Logs utiles : /var/log/apache2/error.log et /usr/local/nagios/var/nagios.log

---

<p align="center">
  <b>🔐 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour une cybersécurité compréhensible et efficace. 🔐</b>
</p>
