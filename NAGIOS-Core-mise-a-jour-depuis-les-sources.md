<div align="center">
  
  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3ESUPERVISION+NAGIOS_" alt="Titre dynamique SUPERVISION NAGIOS" />
  </a>
  
  <br></br>

  <h2>Laboratoire numérique pour la cybersécurité, Linux & IT</h2>

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

<!--
Optimisation SEO : mots-clés cybersécurité, Linux, administration système, sécurité informatique, tutoriels, guides, expertise, formation, supervision, Docker, OpenVAS, firewall, proxy, DNS, SSH, Debian, IT, réseau, cryptographie, open source, ressources techniques, étudiants, professionnels, passionnés.
-->

<div align="center">
  <img src="https://img.icons8.com/fluency/96/000000/cyber-security.png" alt="CyberSec" width="80"/>
</div>

<div align="center">
  <p>
    <strong>Cybersécurité</strong> <img src="https://img.icons8.com/color/24/000000/lock--v1.png"/> • <strong>Linux Debian</strong> <img src="https://img.icons8.com/color/24/000000/linux.png"/> • <strong>Sécurité informatique</strong> <img src="https://img.icons8.com/color/24/000000/shield-security.png"/>
  </p>
</div>

---

## 🚀 À propos & Objectifs

Ce projet propose des solutions innovantes et accessibles en cybersécurité, avec une approche centrée sur la simplicité d’utilisation et l’efficacité. Il vise à accompagner les utilisateurs dans la protection de leurs données et systèmes, tout en favorisant l’apprentissage et le partage des connaissances.

Le contenu est structuré, accessible et optimisé SEO pour répondre aux besoins de :
- 🎓 Étudiants : approfondir les connaissances
- 👨‍💻 Professionnels IT : outils et pratiques
- 🖥️ Administrateurs système : sécuriser l’infrastructure
- 🛡️ Experts cybersécurité : ressources techniques
- 🚀 Passionnés du numérique : explorer les bonnes pratiques

---

# 🧭 Mise à jour complète de Nagios Core et des plugins (2025).

Ce guide permet de mettre à jour **Nagios Core** et les **Nagios Plugins** vers leur dernière version stable, en utilisant les sources officielles.

> ✅ Compatible avec **Nagios Core 4.5.0** et **nagios-plugins 2.4.7** (juillet 2025).

---

## 📦 1. Téléchargement et préparation de Nagios Core.

```bash
cd /opt/nagios/
sudo rm -rf nagioscore*

# Récupération de la dernière version stable depuis GitHub
NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest | grep tag_name | cut -d '"' -f 4)

wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz
tar -xvzf $NAGIOS_VER.tar.gz
cd nagioscore-*/
```

---

## ⚙️ 2. Compilation et installation de Nagios Core.

```bash
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all

# Installation des binaires, CGI et fichiers HTML
sudo make install

# Installation du service Nagios
sudo make install-daemoninit
```

---

## 🔧 3. Mise à jour du fichier de configuration `nagios.cfg`.

> Si vous venez d'une version <= 4.3.2, mettez à jour le fichier `nagios.cfg` pour que la directive `lock_file` pointe vers `/var/run/nagios.lock` :

```bash
sudo sed -i 's|^lock_file=.*|lock_file=/var/run/nagios.lock|' /usr/local/nagios/etc/nagios.cfg
```

---

## 🔄 4. Redémarrage du service Nagios.

```bash
sudo systemctl daemon-reexec
sudo systemctl restart nagios
sudo systemctl status nagios
```

---

## 🧰 5. Mise à jour des plugins Nagios (nagios-plugins).

```bash
cd /opt/nagios/
sudo rm -rf nagios-plugins*

# Récupération de la dernière version stable depuis GitHub
PLUGIN_VER=$(curl -s https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest | grep tag_name | cut -d '"' -f 4)

wget https://github.com/nagios-plugins/nagios-plugins/releases/download/$PLUGIN_VER/$PLUGIN_VER.tar.gz
tar -xvzf $PLUGIN_VER.tar.gz
cd nagios-plugins-*/

./configure
make
sudo make install
```

---

## ✅ Récapitulatif final.

| Étape | Description |
|-------|-------------|
| Téléchargement | Utilisation des dernières versions via API GitHub |
| Compilation | `configure`, `make`, `make install` comme recommandé |
| Service | Redémarrage via `systemctl` |
| Plugins | Ajout de la mise à jour de `nagios-plugins` |
| Robustesse | Utilisation de `cd nagioscore-*/` et chemins dynamiques |

---

<p align="center">
  <b>🔐 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour une cybersécurité compréhensible et efficace. 🔐</b>
</p>
