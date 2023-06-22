<a name="Exemple-serveurs-linux.cfg.md"></a>
 
#### Exemple, configuration injectée dans le fichier /usr/local/nagios/etc/objects/serveurs-linux.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 21-06-2023
# SERVEURS-LINUX.CFG - /usr/local/nagios/etc/objects/
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# HOST DEFINITION - srv-linux-01
# --------------------------------------------------------------------------
define host {

    use                     linux-server

    host_name               srv-linux-01
    alias                   srv-linux-01
    address                 10.111.111.111
    hostgroups              grp-serveurs-linux
    #parents
}

# --------------------------------------------------------------------------
# HOST DEFINITION - srv-linux-02
# --------------------------------------------------------------------------
define host {

    use                     linux-server

    host_name               srv-linux-02
    alias                   srv-linux-02
    address                 10.111.111.222
    hostgroups              grp-serveurs-linux
    #parents
}

# --------------------------------------------------------------------------
# HOST GROUP DEFINITION - grp-serveurs-linux
# --------------------------------------------------------------------------
# Define an optional hostgroup for Linux machines

define hostgroup {

    hostgroup_name          grp-serveurs-linux
    alias                   Groupe serveurs linux
}

# --------------------------------------------------------------------------
# SERVICE DEFINITION - PING - srv-linux-01
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
# SERVICE DEFINITION - PING - srv-linux-02
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
