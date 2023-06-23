<a name="Exemple-router.cfg.md"></a>
 
## - E. Exemple concernant le fichier /usr/local/nagios/etc/objects/router.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 23-06-2023
# ROUTER.CFG - Exemple de fichier de configuration pour Nagios.
# /usr/local/nagios/etc/objects/
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
     parents                 router-02
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
     parents                 router-01
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
     parents                 router-01
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
