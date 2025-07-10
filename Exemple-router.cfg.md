<a name="Exemple-router.cfg.md"></a>
![Nagios](./images/nagios.png)

## Exemple concernant le fichier /usr/local/nagios/etc/objects/router.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 10-07-2025
# Date de modification : le 10-07-2025
# ROUTER.CFG - Exemple de fichier de configuration pour Nagios.
# /usr/local/nagios/etc/objects/router.cfg
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# DEFINITION HOST - router-01
# --------------------------------------------------------------------------
define host {

     use                     generic-router

     host_name               router-01
     alias                   Asus GT AXE-16000
     address                 192.168.0.1
     hostgroups              grp-router
     #parents                router-02
}

# --------------------------------------------------------------------------
# DEFINITION HOST - router-02
# --------------------------------------------------------------------------
define host {

     use                     generic-router

     host_name               router-02
     alias                   Freebox DELTA
     address                 192.168.1.254
     hostgroups              grp-router
     # parents               
}

# --------------------------------------------------------------------------
# DEFINITION HOST - mesh-wifi-A
# --------------------------------------------------------------------------
define host {

     use                     generic-router

     host_name               mesh-wifi-A
     alias                   ZEN-Wifi ET-12
     address                 192.168.0.121
     hostgroups              grp-router
     #parents                router-01
}

# --------------------------------------------------------------------------
# DEFINITION HOST - mesh-wifi-B
# --------------------------------------------------------------------------
define host {

     use                     generic-router

     host_name               mesh-wifi-B
     alias                   ZEN-Wifi ET-12
     address                 192.168.0.110
     hostgroups              grp-router
     #parents                router-01
}

# --------------------------------------------------------------------------
# DEFINITION HOST GROUPS - grp-router
# --------------------------------------------------------------------------
define hostgroup {

     hostgroup_name          grp-router
     alias                   Host groups router
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - router-01 - ping
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               router-01
     service_description     PING
     check_command           check_ping!100.0,20%!500.0,60%
     #check_command          check_ping!900.0,40%!1500.0,70%
     #check_command          check_ping!3000.0,80%!5000.0,100%
     check_interval          5
     retry_interval          1
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - router-02 - ping
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               router-02
     service_description     PING
     check_command           check_ping!100.0,20%!500.0,60%
     #check_command          check_ping!900.0,40%!1500.0,70%
     #check_command          check_ping!3000.0,80%!5000.0,100%
     check_interval          5
     retry_interval          1
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - mesh-wifi-A - ping
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               mesh-wifi-A
     service_description     PING
     check_command           check_ping!100.0,20%!500.0,60%
     #check_command          check_ping!900.0,40%!1500.0,70%
     #check_command          check_ping!3000.0,80%!5000.0,100%
     check_interval          5
     retry_interval          1
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - mesh-wifi-B - ping
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               mesh-wifi-B
     service_description     PING
     check_command           check_ping!100.0,20%!500.0,60%
     #check_command          check_ping!900.0,40%!1500.0,70%
     #check_command          check_ping!3000.0,80%!5000.0,100%
     check_interval          5
     retry_interval          1
}
```
Nous allons tester notre nouvelle configuration que nous avons saisie dans le fichier /usr/local/nagios/etc/objects/router.cfg à l'aide de la commande suivante :
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
Si il n'y a pas d'erreur sur cette nouvelle configuration (router.cfg), redémarrer Nagios pour la prise en compte de cette nouvelle configuration.
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
