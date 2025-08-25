<div align="center">
  
  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3ESUPERVISION+NAGIOS_" alt="Titre dynamique SUPERVISION NAGIOS" />
  </a>
  
  <br></br>
  
  <p align="center">
    <em>Installation de Nagios Core & Plugins-nagios depuis les sources (2025).</em><br>
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

## 📡 Installation de Nagios Core & Plugins depuis les sources (2025).

## 🔧 Prérequis :

Assurez-vous d’avoir un système Debian à jour.

## 📁 1. Préparation du répertoire de travail.

```bash
mkdir -p /opt/nagios/
cd /opt/nagios/
```

## 🔄 2. Mise à jour du système.

```bash
apt update && apt upgrade -y
```

## 📦 3. Installation des dépendances nécessaires.

```bash
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

## 📥 4. Téléchargement et extraction de la dernière version de Nagios Core.

```bash
NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz
tar -xvzf $NAGIOS_VER.tar.gz
cd $NAGIOS_VER
```

## 🛠️ 5. Compilation et installation de Nagios Core.

```bash
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
make install-groups-users
usermod -a -G nagios www-data
make install
make install-daemoninit
make install-commandmode
make install-config
make install-webconf
```

## 🌐 6. Activation des modules Apache.

```bash
a2enmod rewrite
a2enmod cgi
```

## 🔥 7. (Optionnel) Ouverture du port 80 via iptables.

```bash
# iptables -I INPUT -p tcp --destination-port 80 -j ACCEPT
# apt install -y iptables-persistent
```

> Acceptez l’enregistrement des règles si demandé.

## 👤 8. Création de l'utilisateur `nagiosadmin`

```bash
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```

## 🌐 9. Redirection vers l’interface web Nagios.

```bash
echo 'RedirectMatch ^/$ /nagios' >> /etc/apache2/apache2.conf
```

## ▶️ 10. Démarrage des services.

```bash
systemctl start apache2.service
systemctl start nagios.service
```

---

## ✅ Accès à l’interface Web.

Rendez-vous à l’adresse suivante dans un navigateur :

```
http://<IP_SERVEUR>/nagios
http://<FQDN_SERVEUR>/nagios
```

Utilisez l’identifiant `nagiosadmin` et le mot de passe défini précédemment.

---

# 🔌 Installation des Plugins Nagios.

## 📦 1. Installation des dépendances.

```bash
cd /opt/nagios/
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

## 📥 2. Téléchargement de la dernière version des plugins.

```bash
VER=$(curl -s https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/release-//')
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$VER/nagios-plugins-$VER.tar.gz
```

### 🔁 Si les liens échouent :

Rendez-vous sur [https://nagios-plugins.org/download/](https://nagios-plugins.org/download/), puis :

```bash
VER=2.4.8
wget https://nagios-plugins.org/download/nagios-plugins-$VER.tar.gz
```

## 🗜️ 3. Extraction et compilation.

```bash
tar -xvzf nagios-plugins-${VER}.tar.gz
cd nagios-plugins-$VER
./tools/setup   # (facultatif)
./configure
make
make install
```

---

## 🧪 Vérification dans l’interface Web.

```
http://<IP_SERVEUR>/nagios
http://<FQDN_SERVEUR>/nagios
```

- Vérifiez que les plugins sont visibles.
- Pensez à décommenter les variables `parents` dans vos fichiers de config si vous utilisez une topologie.

### Exemple de rendu :

![Map Nagios](./images/nagios_map.png)  
![Nagios Host Groups](./images/nagios_service_Host_Groups.png)

---

## ♻️ Redémarrage des services.

```bash
systemctl restart apache2.service
systemctl restart nagios.service
```

---

## 🎉 Félicitations !

Nagios Core et ses plugins sont maintenant installés et fonctionnels 🎊

---

<p align="center">
  <b>🔐 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour une cybersécurité compréhensible et efficace. 🔐</b>
</p>
