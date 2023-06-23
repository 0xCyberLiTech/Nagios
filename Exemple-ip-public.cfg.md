# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 23-06-2023
# IP-PUBLIC.CFG - Exemple de fichier de configuration pour Nagios.
# /usr/local/nagios/etc/objects/
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
     parents                 router-02
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
     parents                 router-02
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
     parents                 router-02
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
