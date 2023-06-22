<a name="Exemple-serveurs-linux.cfg.md"></a>
 
#### Exemple du fichier de configuration /usr/local/nagios/etc/objects/serveurs-linux.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 22-06-2023
# SERVEURS-LINUX.CFG - /usr/local/nagios/etc/objects/
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# DEFINITION HOST - srv-linux-01
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
# DEFINITION HOST - srv-linux-02
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
# DEFINITION HOST GROUP - grp-serveurs-linux
# --------------------------------------------------------------------------
# Define an optional hostgroup for Linux machines

define hostgroup {

    hostgroup_name          grp-serveurs-linux
    alias                   Groupe serveurs linux
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
define service {
    use                     generic-service
    host_name               srv-linux-01
    service_description     Current Users
    check_command           check_nrpe!check_users
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Load average
# --------------------------------------------------------------------------
define service {
    use                     generic-service
    host_name               srv-linux-01
    service_description     Load average
    check_command           check_nrpe!check_load
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Disk partition /
# --------------------------------------------------------------------------
define service{
    use                     generic-service
    host_name               srv-linux-01
    service_description     Disk partition /
    check_command           check_nrpe!check_disk
    normal_check_interval   30
    retry_check_interval    5
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Disk partition /swap
# --------------------------------------------------------------------------
define service{
     use                     generic-service
     host_name               srv-linux-01
     service_description     Disk partition /swap
     check_command           check_nrpe!check_swap
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Total Processes
# --------------------------------------------------------------------------
define service{
     use                     generic-service
     host_name               srv-linux-01
     service_description     Total Processes
     check_command           check_nrpe!check_total_procs
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - Zombies Processes
# --------------------------------------------------------------------------
define service{
        use                     generic-service
        host_name               srv-linux-01
        service_description     Zombies Processes
        check_command           check_nrpe!check_zombie_procs
        normal_check_interval   60
        retry_check_interval    5
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - ssh port 2234
# --------------------------------------------------------------------------
define service {

        use                     local-service
        host_name               srv-linux-01
        service_description     SSH_2234
        # check_command         check_ssh!2234
        check_command           check_ssh_altport!2234
        notifications_enabled   0
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-01 - http port 80
# --------------------------------------------------------------------------
define service {

        use                     local-service
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
define service {
    use                     generic-service
    host_name               srv-linux-02
    service_description     Current Users
    check_command           check_nrpe!check_users
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Load average
# --------------------------------------------------------------------------
define service {
    use                     generic-service
    host_name               srv-linux-02
    service_description     Load average
    check_command           check_nrpe!check_load
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Disk partition /
# --------------------------------------------------------------------------
define service{
    use                     generic-service
    host_name               srv-linux-02
    service_description     Disk partition /
    check_command           check_nrpe!check_disk
    normal_check_interval   30
    retry_check_interval    5
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Disk partition /swap
# --------------------------------------------------------------------------
define service{
     use                     generic-service
     host_name               srv-linux-02
     service_description     Disk partition /swap
     check_command           check_nrpe!check_swap
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Total Processes
# --------------------------------------------------------------------------
define service{
     use                     generic-service
     host_name               srv-linux-02
     service_description     Total Processes
     check_command           check_nrpe!check_total_procs
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - Zombies Processes
# --------------------------------------------------------------------------
define service{
        use                     generic-service
        host_name               srv-linux-02
        service_description     Zombies Processes
        check_command           check_nrpe!check_zombie_procs
        normal_check_interval   60
        retry_check_interval    5
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - ssh port 2234
# --------------------------------------------------------------------------
define service {

        use                     local-service
        host_name               srv-linux-02
        service_description     SSH_2234
        # check_command         check_ssh!2234
        check_command           check_ssh_altport!2234
        notifications_enabled   0
}

# --------------------------------------------------------------------------
# DEFINITION SERVICE - srv-linux-02 - http port 80
# --------------------------------------------------------------------------
define service {

        use                     local-service
        host_name               srv-linux-02
        service_description     HTTP
        check_command           check_http
        notifications_enabled   0
}
```
