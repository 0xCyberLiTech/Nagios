

## Exemple concernant le fichier /usr/local/nagios/etc/nagios.cfg

```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 21-06-2023
#
# NAGIOS.CFG - Exemple de fichier de configuration principal pour Nagios 4.x.x
#
# Lire la documentation pour plus d'informations sur cette configuration
# déposer. J'ai fourni quelques commentaires ici, mais les choses ne sont peut-être pas si
# clair sans autre explication.
# --------------------------------------------------------------------------


# LOG FILE
# This is the main log file where service and host events are logged
# for historical purposes.  This should be the first option specified
# in the config file!!!

log_file=/usr/local/nagios/var/nagios.log

# OBJECT CONFIGURATION FILE(S)
# These are the object configuration files in which you define hosts,
# host groups, contacts, contact groups, services, etc.
# You can split your object definitions across several config files
# if you wish (as shown below), or keep them all in a single config file.

# You can specify individual object config files as shown below:
cfg_file=/usr/local/nagios/etc/objects/commands.cfg
cfg_file=/usr/local/nagios/etc/objects/contacts.cfg
cfg_file=/usr/local/nagios/etc/objects/timeperiods.cfg
cfg_file=/usr/local/nagios/etc/objects/templates.cfg

# Definitions for monitoring the local (Linux) host
cfg_file=/usr/local/nagios/etc/objects/localhost.cfg

# Definitions for monitoring a Windows machine
#cfg_file=/usr/local/nagios/etc/objects/windows.cfg

# Definitions for monitoring a router/switch
#cfg_file=/usr/local/nagios/etc/objects/switch.cfg

# Definitions for monitoring a network printer
#cfg_file=/usr/local/nagios/etc/objects/printer.cfg
```
Nous pouvons constater que les lignes suivantes de base ne sont pas commentées (#) :

```
cfg_file=/usr/local/nagios/etc/objects/commands.cfg
cfg_file=/usr/local/nagios/etc/objects/contacts.cfg
cfg_file=/usr/local/nagios/etc/objects/timeperiods.cfg
cfg_file=/usr/local/nagios/etc/objects/templates.cfg
cfg_file=/usr/local/nagios/etc/objects/localhost.cfg
```
#### Donc ces fichiers existent vers /usr/local/nagios/etc/objects/
#### Il est donc possible de déclarer de nouveaux fichiers dans /usr/local/nagios/etc/nagios.cfg
```
cfg_file=/usr/local/nagios/etc/objects/serveurs-linux.cfg
cfg_file=/usr/local/nagios/etc/objects/serveurs-windows.cfg
cfg_file=/usr/local/nagios/etc/objects/routeurs.cfg
cfg_file=/usr/local/nagios/etc/objects/imprimantes.cfg

```
#### A partir de cet instant il faudra créer ceux-ci vers /usr/local/nagios/etc/objects/

```
touch /usr/local/nagios/etc/objects/serveurs-linux.cfg
touch /usr/local/nagios/etc/objects/serveurs-windows.cfg
touch /usr/local/nagios/etc/objects/routeurs.cfg
touch /usr/local/nagios/etc/objects/imprimantes.cfg
```
#### Je vous conseille de mettre en service qu'un fichier à la fois.

```
cfg_file=/usr/local/nagios/etc/objects/serveurs-linux.cfg
#cfg_file=/usr/local/nagios/etc/objects/serveurs-windows.cfg
#cfg_file=/usr/local/nagios/etc/objects/routeurs.cfg
#cfg_file=/usr/local/nagios/etc/objects/imprimantes.cfg
```
#### Ne pas oublier de sauvegarder votre fichier /usr/local/nagios/etc/nagios.cfg
#### Positionner les droits qui conviennent sur ces fichiers.

```
chown nagios:nagios /usr/local/nagios/etc/objects/serveurs-linux.cfg
chown nagios:nagios /usr/local/nagios/etc/objects/serveurs-windows.cfg
chown nagios:nagios /usr/local/nagios/etc/objects/routeurs.cfg
chown nagios:nagios /usr/local/nagios/etc/objects/imprimantes.cfg
```
#### Tester dabord votre nouvelle configuration que vous avez saisie dans le fichier /usr/local/nagios/etc/objects/serveurs-linux.cfg avec la commande suivante :

```
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
```
Exemple, configuration injectée dans le fichier /usr/local/nagios/etc/objects/serveurs-linux.cfg

```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 21-06-2023
#
# SERVEURS-LINUX.CFG - Exemple de fichier de configuration 
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# HOST DEFINITION
# --------------------------------------------------------------------------
# Define a host for the local machine

define host {

    use                     linux-server

    host_name               srv-linux-01
    alias                   srv-linux-01
    address                 10.111.111.111
}

define host {

    use                     linux-server

    host_name               srv-linux-02
    alias                   srv-linux-02
    address                 10.111.111.222
}

# --------------------------------------------------------------------------
# HOST GROUP DEFINITION
# --------------------------------------------------------------------------

# Define an optional hostgroup for Linux machines

define hostgroup {

    hostgroup_name          grp-linux-servers
    alias                   group Linux Servers
    members                 srv-linux-02, srv-linux-02
}


# --------------------------------------------------------------------------
# SERVICE DEFINITIONS
# --------------------------------------------------------------------------

# Define a service to "ping" the srv-linux-01

define service {

    use                     generic-service
    host_name               srv-linux-01
    service_description     PING
    check_command           check_ping!100.0,20%!500.0,60%
}

# Define a service to "ping" the srv-linux-02

define service {

    use                     generic-service
    host_name               srv-linux-02
    service_description     PING
    check_command           check_ping!100.0,20%!500.0,60%
}

```
#### Si il n'y a pas d'erreur sur cette nouvelle configuration (serveurs-linux.cfg), redémarrer Nagios pour la prise en compte de cette configuration.

```
systemctl restart nagios.service
```
