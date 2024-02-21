![Nagios](./images/nagios.png)

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
