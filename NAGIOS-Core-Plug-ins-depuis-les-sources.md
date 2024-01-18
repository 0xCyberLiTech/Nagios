![Nagios](./images/nagios.png)

## NAGIOS Mise à jour depuis les sources.
- Téléchargement des sources de Nagios-core dans sa dernère version stable.
```
cd /tmp
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
cd /tmp/nagioscore-nagios-4.5.0/
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
Update nagios.cfg

If you are upgrading from Nagios Core 4.3.2 and earlier you will need to update the nagios.cfg file to point to /var/run/nagios.lock using the following command:
```
sed -i 's/^lock_file=.*/lock_file=\/var\/run\/nagios.lock/g' /usr/local/nagios/etc/nagios.cfg
```
