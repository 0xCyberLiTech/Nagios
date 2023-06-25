<a name="Exemple-ip-public.cfg.md"></a>
 
## - G. Exemple concernant le fichier /usr/local/nagios/etc/objects/ip-public.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 23-06-2023
# IP-PUBLIC.CFG - Exemple de fichier de configuration pour Nagios.
# /usr/local/nagios/etc/objects/ip-public.cfg
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# DEFINITION HOST - ip-public-free
# --------------------------------------------------------------------------
define host {

     use                     generic-wan

     host_name               ip-public-free
     alias                   WAN Free 0.0.0.0    # Renseigner votre adresse ip fixe public
     address                 0.0.0.0             # Renseigner votre adresse ip fixe public
     hostgroups              grp-ip-public
     #parents                router-02
}

# --------------------------------------------------------------------------
# DEFINITION HOST - dns1-public-free - 212.27.40.240
# --------------------------------------------------------------------------
define host {

     use                     generic-wan

     host_name               dns1-public-free
     alias                   DNS FAI Free 212.27.40.240
     address                 212.27.40.240
     hostgroups              grp-ip-public
     #parents                router-02
}

# --------------------------------------------------------------------------
# DEFINITION HOST - dns2-public-free - 212.27.40.241
# --------------------------------------------------------------------------
define host {

     use                     generic-wan

     host_name               dns2-public-free
     alias                   DNS FAI Free 212.27.40.241
     address                 212.27.40.241
     hostgroups              grp-ip-public
     #parents                router-02
}

# --------------------------------------------------------------------------
# DEFINITION HOST GROUPS - grp-ip-public
# --------------------------------------------------------------------------
define hostgroup {

     hostgroup_name          grp-ip-public
     alias                   Host groups ip public
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - ip-public-free - ping
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               ip-public-free
     service_description     PING
     #check_command          check_ping!100.0,20%!500.0,60%
     check_command           check_ping!900.0,40%!1500.0,70%
     #check_command          check_ping!3000.0,80%!5000.0,100%
     check_interval          5
     retry_interval          1
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - dns1-public-free - ping
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               dns1-public-free
     service_description     PING
     #check_command          check_ping!100.0,20%!500.0,60%
     check_command           check_ping!900.0,40%!1500.0,70%
     #check_command          check_ping!3000.0,80%!5000.0,100%
     check_interval          5
     retry_interval          1
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - dns2-public-free - ping
# --------------------------------------------------------------------------
define service {

     use                     generic-service
     host_name               dns2-public-free
     service_description     PING
     #check_command          check_ping!100.0,20%!500.0,60%
     check_command           check_ping!900.0,40%!1500.0,70%
     #check_command          check_ping!3000.0,80%!5000.0,100%
     check_interval          5
     retry_interval          1
}
```
Nous allons tester notre nouvelle configuration que nous avons saisie dans le fichier /usr/local/nagios/etc/objects/ip-public.cfg à l'aide de la commande suivante :
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
Si il n'y a pas d'erreur sur cette nouvelle configuration (ip-public.cfg), redémarrer Nagios pour la prise en compte de cette nouvelle configuration.
```
systemctl restart nagios.service
```

