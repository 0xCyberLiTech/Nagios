<a name="Exemple-nagios.cfg.md"></a>

## - B. Exemple concernant le fichier /usr/local/nagios/etc/nagios.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 21-06-2023
# NAGIOS.CFG - Exemple de fichier de configuration pour Nagios
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
#### Nous pouvons constater que les lignes suivantes de base ne sont pas commentées (#) :
```
cfg_file=/usr/local/nagios/etc/objects/commands.cfg
cfg_file=/usr/local/nagios/etc/objects/contacts.cfg
cfg_file=/usr/local/nagios/etc/objects/timeperiods.cfg
cfg_file=/usr/local/nagios/etc/objects/templates.cfg
cfg_file=/usr/local/nagios/etc/objects/localhost.cfg
```
#### Donc ces fichiers existent vers /usr/local/nagios/etc/objects/
#### Il est donc possible de déclarer arbitrairement de nouveaux fichiers dans /usr/local/nagios/etc/nagios.cfg
```
Exemples :

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
#### Exemple, configuration injectée dans le fichier /usr/local/nagios/etc/objects/serveurs-linux.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 22-06-2023
# SERVER-LINUX.CFG - /usr/local/nagios/etc/objects/
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# DEFINITION HOST - srv-linux-01
# --------------------------------------------------------------------------
define host {

     use                     linux-server

     host_name               srv-linux-01
     alias                   srv-linux-01
     address                 192.168.50.200
     hostgroups              grp-server-linux
     parents                 router-01
}

# --------------------------------------------------------------------------
# DEFINITION HOST - srv-linux-02
# --------------------------------------------------------------------------
define host {

     use                     linux-server

     host_name               srv-linux-02
     alias                   srv-linux-02
     address                 192.168.50.201
     hostgroups              grp-server-linux
     parents                 router-01
}

# --------------------------------------------------------------------------
# DEFINITION HOST GROUP - grp-server-linux
# --------------------------------------------------------------------------
define hostgroup {

     hostgroup_name          grp-server-linux
     alias                   Host Groups server linux
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - ping
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               srv-linux-01
     service_description     PING
     check_command           check_ping!100.0,20%!500.0,60%
     #check_command          check_ping!900.0,40%!1500.0,70%
     #check_command          check_ping!3000.0,80%!5000.0,100%
     check_interval          5
     retry_interval          1
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Current Users
# --------------------------------------------------------------------------
# define service {
#    use                     local-service
#    host_name               srv-linux-01
#    service_description     Current Users
#    check_command           check_nrpe!check_users
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Load average
# --------------------------------------------------------------------------
# define service {
#
#    use                     generic-service
#    host_name               srv-linux-01
#    service_description     Load average
#    check_command           check_nrpe!check_load
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Disk partition /
# --------------------------------------------------------------------------
# define service{
#
#    use                     generic-service
#    host_name               srv-linux-01
#    service_description     Disk partition /
#    check_command           check_nrpe!check_disk
#    normal_check_interval   30
#    retry_check_interval    5
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Disk partition /swap
# --------------------------------------------------------------------------
# define service{
#
#    use                     generic-service
#    host_name               srv-linux-01
#    service_description     Disk partition /swap
#    check_command           check_nrpe!check_swap
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Total Processes
# --------------------------------------------------------------------------
# define service{
#
#    use                     generic-service
#    host_name               srv-linux-01
#    service_description     Total Processes
#    check_command           check_nrpe!check_total_procs
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Zombies Processes
# --------------------------------------------------------------------------
# define service{
#
#    use                     generic-service
#    host_name               srv-linux-01
#    service_description     Zombies Processes
#    check_command           check_nrpe!check_zombie_procs
#    normal_check_interval   60
#    retry_check_interval    5
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - ssh port 2234
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               srv-linux-01
     service_description     SSH_2234
     check_command           check_ssh!2234
#    check_command           check_ssh_altport!2234
     notifications_enabled   0
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - http port 80
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               srv-linux-01
     service_description     HTTP
     check_command           check_http
     notifications_enabled   0
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - ping
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               srv-linux-02
     service_description     PING
     check_command           check_ping!100.0,20%!500.0,60%
     #check_command          check_ping!900.0,40%!1500.0,70%
     #check_command          check_ping!3000.0,80%!5000.0,100%
     check_interval          5
     retry_interval          1
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Current Users
# --------------------------------------------------------------------------
# define service {
#    use                     generic-service
#    host_name               srv-linux-02
#    service_description     Current Users
#    check_command           check_nrpe!check_users
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Load average
# --------------------------------------------------------------------------
# define service {
#
#    use                     generic-service
#    host_name               srv-linux-02
#    service_description     Load average
#    check_command           check_nrpe!check_load
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Disk partition /
# --------------------------------------------------------------------------
# define service{
#
#    use                     generic-service
#    host_name               srv-linux-02
#    service_description     Disk partition /
#    check_command           check_nrpe!check_disk
#    normal_check_interval   30
#    retry_check_interval    5
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Disk partition /swap
# --------------------------------------------------------------------------
# define service{
#
#    use                     generic-service
#    host_name               srv-linux-02
#    service_description     Disk partition /swap
#    check_command           check_nrpe!check_swap
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Total Processes
# --------------------------------------------------------------------------
# define service{
#
#    use                     generic-service
#    host_name               srv-linux-02
#    service_description     Total Processes
#    check_command           check_nrpe!check_total_procs
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Zombies Processes
# --------------------------------------------------------------------------
# define service{
#
#    use                     generic-service
#    host_name               srv-linux-02
#    service_description     Zombies Processes
#    check_command           check_nrpe!check_zombie_procs
#    normal_check_interval   60
#    retry_check_interval    5
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - ssh port 2234
# --------------------------------------------------------------------------
# efine service {
#
#    use                     generic-service
#    host_name               srv-linux-02
#    service_description     SSH_2234
##   heck_command            check_ssh!2234
#    check_command           check_ssh_altport!2234
#    notifications_enabled   0
# }

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - http port 80
# --------------------------------------------------------------------------
# define service {
#
#    use                     generic-service
#    host_name               srv-linux-02
#    service_description     HTTP
#    check_command           check_http
#    notifications_enabled   0
# }
```
#### Tester dabord votre nouvelle configuration que vous avez saisie dans le fichier /usr/local/nagios/etc/objects/serveurs-linux.cfg à l'aide de la commande suivante :
```
# --------------------------------------------------------------------------
# - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG -
# --------------------------------------------------------------------------
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

Checking objects...
        Checked 10 services.
        Checked 3 hosts.
        Checked 2 host groups.
        Checked 0 service groups.
        Checked 1 contacts.
        Checked 1 contact groups.
        Checked 24 commands.
        Checked 5 time periods.
        Checked 0 host escalations.
        Checked 0 service escalations.
Checking for circular paths...
        Checked 3 hosts
        Checked 0 service dependencies
        Checked 0 host dependencies
        Checked 5 timeperiods
Checking global event handlers...
Checking obsessive compulsive processor commands...
Checking misc settings...

Total Warnings: 0
Total Errors:   0
```
#### Si il n'y a pas d'erreur sur cette nouvelle configuration (serveurs-linux.cfg), redémarrer Nagios pour la prise en compte de cette configuration.
```
systemctl restart nagios.service
```
