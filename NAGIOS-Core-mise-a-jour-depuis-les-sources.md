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

### 🧭 **Script (update_nagios.sh) : Mise à jour de Nagios depuis les sources :**

Créer un fichier nommé update_nagios.sh vers /usr/local/

```bash
nano /usr/local/update_nagios.sh
```

- Copie le code ci-dessous dans ce fichier créé précédemment /usr/local/update_nagios.sh.

```bash
#!/bin/bash

# ============================================================================
# 🔄 Script de mise à jour de Nagios Core depuis les sources (version stable)
# ============================================================================

set -e

echo "📦 Mise à jour de Nagios Core..."

# Dossier de travail
cd /opt/nagios/ || {
  echo "❌ Erreur : /opt/nagios/ n'existe pas"
  exit 1
}

# Nettoyage des anciennes sources
echo "🧹 Suppression des anciennes sources..."
rm -rf nagioscore*

# Récupération de la dernière version disponible
echo "🌐 Téléchargement de la dernière version de Nagios Core..."
NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz

# Extraction
echo "📦 Extraction de l'archive..."
tar -xvzf $NAGIOS_VER.tar.gz

# Compilation
echo "🛠 Compilation de Nagios Core..."
cd nagioscore-* || {
  echo "❌ Erreur : impossible d'accéder au dossier extrait"
  exit 1
}

./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all

# Installation
echo "📥 Installation des binaires, CGI et HTML..."
make install

echo "⚙️ Mise à jour du service Nagios..."
make install-daemoninit

# Mise à jour du fichier de configuration (si besoin)
echo "📝 Vérification et mise à jour de nagios.cfg..."
sed -i 's/^lock_file=.*/lock_file=\/var\/run\/nagios.lock/g' /usr/local/nagios/etc/nagios.cfg

echo "✅ Mise à jour de Nagios Core terminée avec succès."
```

- Positionner les droits qui conviennent a son exécution. :

```bash
chmod +x /usr/local/update_nagios.sh
```

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
