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

### 🧭 **Mise à jour de Nagios depuis les sources dans ça dernière version :**

## NAGIOS Mise à jour depuis les sources.

- Téléchargement des sources de Nagios-core dans sa dernère version stable.
```
cd /opt/nagios/
```
```
rm -rf nagioscore*
```
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
Compile :
```
cd nagioscore-nagios-4.5.0/
```
```
./configure --with-httpd-conf=/etc/apache2/sites-enabled
```
```
make all
```
Install Binaries

Cette étape installe les fichiers binaires, les CGI et les fichiers HTML.
```
make install
```
Install Service / Daemon

Cela installe les fichiers de service ou de démon. Bien que ceux-ci existent déjà, ils sont mis à jour de temps en temps et doivent donc être remplacés.
```
make install-daemoninit
```


IMPORTANT (Update nagios.cfg) :

Si vous effectuez une mise à niveau depuis Nagios Core 4.3.2 et versions antérieures, vous devrez mettre à jour le fichier nagios.cfg pour qu'il pointe vers /var/run/nagios.lock à l'aide de la commande suivante :
```
sed -i 's/^lock_file=.*/lock_file=\/var\/run\/nagios.lock/g' /usr/local/nagios/etc/nagios.cfg
```










```bash
chmod +x /usr/local/update_nagios.sh
```

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
