![Nagios](./images/nagios.png)

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

> Bienvenue dans mon **laboratoire numérique personnel** dédié à l’apprentissage et à la vulgarisation de la cybersécurité.  
> Passionné par **Linux**, la **cryptographie** et les **systèmes sécurisés**, je partage ici mes notes, expérimentations et fiches pratiques.  
>  
> 🎯 **Objectif :** proposer un contenu clair, structuré et accessible pour étudiants, curieux et professionnels de l’IT.  
> 🔗 [Mon GitHub principal](https://github.com/0xCyberLiTech)

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim" alt="Skills" />
  </a>
</p>

---

### 🎯 **Objectif de ce dépôt.**

> Ce dépôt a pour vocation de centraliser un ensemble de notions clés en supervision informatique. Il s’adresse aux passionnés, étudiants et professionnels souhaitant mieux comprendre les enjeux de la
> surveillance des systèmes d'information, apprendre à mettre en place des outils de monitoring efficaces et se familiariser avec les concepts et bonnes pratiques pour maintenir la performance et la stabilité de
> leurs environnements IT.

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

> 💡 Ce guide est prévu pour Debian 12+ / Ubuntu 22.04+. Pour CentOS/RHEL, adaptez les chemins et services (ex. httpd au lieu d’apache2).

---

**Mise à jour :** Juillet 2025.

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
