<a name="Exemple-server-linux.cfg.md"></a>
![Nagios](./images/nagios.png)

## Exemple concernant le fichier /usr/local/nagios/etc/objects/server-linux.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 27-06-2023
# SERVERS-LINUX.CFG - /usr/local/nagios/etc/objects/
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# SERVEUR LOCAL : srv-linux-01
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
# DEFINITION SERVICE - srv-linux-01 - check_local_disk
# --------------------------------------------------------------------------
# Définir un service pour vérifier l'espace disque de la partition racine
# sur la machine locale. Avertissement si < 20 % libre, critique si
# < 10 % d'espace libre sur la partition.
define service {

    use                     local-service
    host_name               srv-linux-01
    service_description     Root Partition
    check_command           check_local_disk!20%!10%!/
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - check_local_users
# --------------------------------------------------------------------------
# Définissez un service pour vérifier le nombre de personnes actuellement connectées
# utilisateurs sur la machine locale. Avertissement si > 20 utilisateurs, critique
# si > 50 utilisateurs.
define service {

    use                     local-service
    host_name               srv-linux-01
    service_description     Current Users
    check_command           check_local_users!20!50
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - check_local_procs
# --------------------------------------------------------------------------
# Définir un service pour vérifier le nombre de procs en cours d'exécution
# sur la machine locale. Avertissement si > 250 processus, critique si
# > 400 processus.
define service {

    use                     local-service
    host_name               srv-linux-01
    service_description     Total Processes
    check_command           check_local_procs!250!400!RSZDT
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - check_local_load
# --------------------------------------------------------------------------
# Définissez un service pour vérifier la charge sur la machine locale.
define service {

    use                     local-service
    host_name               srv-linux-01
    service_description     Current Load
    check_command           check_local_load!5.0,4.0,3.0!10.0,6.0,4.0
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - check_local_swap
# --------------------------------------------------------------------------
# Définissez un service pour vérifier l'utilisation du swap sur la machine locale.
# Critique si moins de 10 % du swap est libre, avertissement si moins de 20 % est libre.
define service {

    use                     local-service
    host_name               srv-linux-01
    service_description     Swap Usage
    check_command           check_local_swap!20%!10%
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - check_local_ssh
# --------------------------------------------------------------------------
# Définissez un service pour vérifier SSH sur la machine locale.
# Désactivez les notifications pour ce service par défaut, car tous les utilisateurs n'ont peut-être pas activé SSH.
define service {

    use                     local-service
    host_name               srv-linux-01
    service_description     SSH
    #check_command          check_ssh
    check_command           check_ssh!2234
    notifications_enabled   0
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - check_local_http
# --------------------------------------------------------------------------
# Définissez un service pour vérifier HTTP sur la machine locale.
# Désactivez les notifications pour ce service par défaut, car HTTP n'est peut-être pas activé pour tous les utilisateurs.
define service {

    use                     local-service
    host_name               srv-linux-01
    service_description     HTTP
    check_command           check_http
    notifications_enabled   0
}

# --------------------------------------------------------------------------
# SERVEUR DISTANT : srv-linux-02
# --------------------------------------------------------------------------
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
```
Nous allons tester notre nouvelle configuration que nous avons saisie dans le fichier /usr/local/nagios/etc/objects/server-linux.cfg à l'aide de la commande suivante :
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
Si il n'y a pas d'erreur sur cette nouvelle configuration (server-linux.cfg), redémarrer Nagios pour la prise en compte de cette nouvelle configuration.
```
systemctl restart nagios.service
```
```
systemctl status nagios.service

● nagios.service - Nagios Core 4.4.13
     Loaded: loaded (/lib/systemd/system/nagios.service; enabled; preset: enabled)
     Active: active (running) since Sun 2023-06-25 10:45:29 CEST; 8s ago
       Docs: https://www.nagios.org/documentation
    Process: 13282 ExecStartPre=/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg (code=exited, status=0/SUCCESS)
    Process: 13283 ExecStart=/usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg (code=exited, status=0/SUCCESS)
   Main PID: 13284 (nagios)
      Tasks: 12 (limit: 4644)
     Memory: 7.9M
        CPU: 115ms
     CGroup: /system.slice/nagios.service
             ├─13284 /usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg
             ├─13285 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
             ├─13286 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
             ├─13287 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
             ├─13288 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
             ├─13289 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
             ├─13290 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
             ├─13291 /usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg
             ├─13292 /usr/local/nagios/libexec/check_ping -H 192.168.50.200 -w 100.0,20% -c 500.0,60% -p 5
             ├─13293 /usr/bin/ping -n -U -w 10 -c 5 192.168.50.200
             ├─13295 /usr/local/nagios/libexec/check_ping -H 192.168.50.110 -w 100.0,20% -c 500.0,60% -p 5
             └─13297 /usr/bin/ping -n -U -w 10 -c 5 192.168.50.110
```
