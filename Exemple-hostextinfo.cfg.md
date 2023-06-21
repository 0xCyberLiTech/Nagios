
## Exemple concernant le fichier /usr/local/nagios/etc/hostextinfo.cfg

#### Il est donc nécessaire de déclarer ce fichier dans /usr/local/nagios/etc/nagios.cfg

```
Exemple :

cfg_file=/usr/local/nagios/etc/objects/serveurs-linux.cfg
#cfg_file=/usr/local/nagios/etc/objects/serveurs-windows.cfg
#cfg_file=/usr/local/nagios/etc/objects/routeurs.cfg
#cfg_file=/usr/local/nagios/etc/objects/imprimantes.cfg

cfg_file=/usr/local/nagios/etc/objects/hostextinfo.cfg
```
#### Nous allons pouvoir créer celui-ci dans /usr/local/nagios/etc/objects/

```
touch /usr/local/nagios/etc/objects/hostextinfo.cfg
```
#### Nous allons repositionner les droits qui conviennent sur ce fichier.

```
chown nagios:nagios /usr/local/nagios/etc/objects/hostextinfo.cfg
```
#### 

```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 21-06-2023
# HOSTEXTINFO.CFG - Exemple de fichier de configuration pour Nagios
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - srv-linux-01
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   srv-linux-01
    notes                       (1) Serveur Linux
    #notes_url                  https://10.111.111.111:8443
    #action_url                 https://10.111.111.111:8444
    icon_image_alt              (1) Serveur Linux
    icon_image                  linux40.gif
    statusmap_image             linux40.gd2
    vrml_image                  linux40.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - srv-linux-02
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   srv-linux-02
    notes                       (2) Serveur Linux
    #notes_url                  https://10.111.111.222:8443
    #action_url                 https://10.111.111.222:8444
    icon_image_alt              (2) Serveur Linux
    icon_image                  linux40.gif
    statusmap_image             linux40.gd2
    vrml_image                  linux40.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}
```
#### Tester dabord votre nouvelle configuration que vous avez saisie dans le fichier /usr/local/nagios/etc/objects/hostextinfo.cfg à l'aide de la commande suivante :
```
# --------------------------------------------------------------------------
# - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG -
# --------------------------------------------------------------------------
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
```
#### Si il n'y a pas d'erreur sur cette nouvelle configuration (hostextinfo.cfg), redémarrer Nagios pour la prise en compte de cette configuration.
```
systemctl restart nagios.service
```

