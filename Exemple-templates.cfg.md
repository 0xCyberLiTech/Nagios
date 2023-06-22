<a name="Exemple-templates.cfg.md"></a>

## - D. Exemple concernant le fichier /usr/local/nagios/etc/objects/templates.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 21-06-2023
# TEMPLATES.CFG - Exemple de fichier de configuration pour Nagios
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# CONTACT TEMPLATES
# --------------------------------------------------------------------------
# Generic contact definition template
# This is NOT a real contact, just a template!

define contact {

    name                            generic-contact
    service_notification_period     24x7
    host_notification_period        24x7
    service_notification_options    w,u,c,r,f,s
    host_notification_options       d,u,r,f,s
    service_notification_commands   notify-service-by-email
    host_notification_commands      notify-host-by-email
    register                        0
}

# --------------------------------------------------------------------------
# HOST TEMPLATES
# --------------------------------------------------------------------------
# Generic host definition template
# This is NOT a real host, just a template!

define host {

    name                            generic-host
    notifications_enabled           1
    event_handler_enabled           1
    flap_detection_enabled          1
    process_perf_data               1
    retain_status_information       1
    retain_nonstatus_information    1
    notification_period             24x7
    register                        0
}

# Linux host definition template
# This is NOT a real host, just a template!

define host {

    name                            linux-server
    use                             generic-host
    check_period                    24x7
    check_interval                  5
    retry_interval                  1
    max_check_attempts              10
    check_command                   check-host-alive
    notification_period             workhours
    notification_interval           120
    notification_options            d,u,r
    contact_groups                  admins
    register                        0
}

# Windows host definition template
# This is NOT a real host, just a template!

define host {

    name                            windows-server
    use                             generic-host
    check_period                    24x7
    check_interval                  5
    retry_interval                  1
    max_check_attempts              10
    check_command                   check-host-alive
    notification_period             24x7
    notification_interval           30
    notification_options            d,r
    contact_groups                  admins
    hostgroups                      windows-servers
    register                        0
}

# We define a generic printer template that can
# be used for most printers we monitor

define host {
    name                            generic-printer
    use                             generic-host
    check_period                    24x7
    check_interval                  5
    retry_interval                  1
    max_check_attempts              10
    check_command                   check-host-alive
    notification_period             workhours
    notification_interval           30
    notification_options            d,r
    contact_groups                  admins
    register                        0
}

# Define a template for servers that we can reuse
define host {
    name                            generic-server
    use                             generic-host
    check_period                    24x7
    check_interval                  5
    retry_interval                  1
    max_check_attempts              10
    check_command                   check-host-alive
    notification_period             24x7
    notification_interval           30
    notification_options            d,r
    contact_groups                  admins
    register                        0
}

# Define a template for switches that we can reuse
define host {
    name                            generic-switch
    use                             generic-host
    check_period                    24x7
    check_interval                  5
    retry_interval                  1
    max_check_attempts              10
    check_command                   check-host-alive
    notification_period             24x7
    notification_interval           30
    notification_options            d,r
    contact_groups                  admins
    register                        0
}

# Define a template for control acces that we can reuse
define host {
    name                            generic-control-acces
    use                             generic-host
    check_period                    24x7
    check_interval                  5
    retry_interval                  1
    max_check_attempts              10
    check_command                   check-host-alive
    notification_period             24x7
    notification_interval           30
    notification_options            d,r
    contact_groups                  admins
    register                        0
}

# Define a template for vlans that we can reuse
define host {
    name                            generic-vlan
    use                             generic-host
    check_period                    24x7
    check_interval                  5
    retry_interval                  1
    max_check_attempts              10
    check_command                   check-host-alive
    notification_period             24x7
    notification_interval           30
    notification_options            d,r
    contact_groups                  admins
    register                        0
}

# Define a template for routers that we can reuse
define host {
    name                            generic-router
    use                             generic-host
    check_period                    24x7
    check_interval                  5
    retry_interval                  1
    max_check_attempts              10
    check_command                   check-host-alive
    notification_period             24x7
    notification_interval           30
    notification_options            d,r
    contact_groups                  admins
    register                        0
}

# Define a template for wifis that we can reuse
define host {
    name                            generic-wifi
    use                             generic-host
    check_period                    24x7
    check_interval                  5
    retry_interval                  1
    max_check_attempts              10
    check_command                   check-host-alive
    notification_period             24x7
    notification_interval           30
    notification_options            d,r
    contact_groups                  admins
    register                        0
}

# Define a template for wans that we can reuse
define host {
    name                            generic-wan
    use                             generic-host
    check_period                    24x7
    check_interval                  5
    retry_interval                  1
    max_check_attempts              10
    check_command                   check-host-alive
    notification_period             24x7
    notification_interval           30
    notification_options            d,r
    contact_groups                  admins
    register                        0
}

# --------------------------------------------------------------------------
# SERVICE TEMPLATES
# --------------------------------------------------------------------------
# Generic service definition template
# This is NOT a real service, just a template!
define service {

    name                            generic-service
    active_checks_enabled           1
    passive_checks_enabled          1
    parallelize_check               1
    obsess_over_service             1
    check_freshness                 0
    notifications_enabled           1
    event_handler_enabled           1
    flap_detection_enabled          1
    process_perf_data               1
    retain_status_information       1
    retain_nonstatus_information    1
    is_volatile                     0
    check_period                    24x7
    max_check_attempts              3
    check_interval                  10
    retry_interval                  2
    contact_groups                  admins
    notification_options            w,u,c,r
    notification_interval           60
    notification_period             24x7
    register                        0
}

# Local service definition template
# This is NOT a real service, just a template!
define service {

    name                            local-service
    use                             generic-service
    max_check_attempts              4
    check_interval                  5
    retry_interval                  1
    register                        0
```
#### Nous allons tester notre nouvelle configuration que nous avons saisie dans le fichier /usr/local/nagios/etc/objects/hostextinfo.cfg à l'aide de la commande suivante :
```
# --------------------------------------------------------------------------
# - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG -
# --------------------------------------------------------------------------
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
```
#### Si il n'y a pas d'erreur sur cette nouvelle configuration (hostextinfo.cfg), redémarrer Nagios pour la prise en compte de cette nouvelle configuration.
```
systemctl restart nagios.service
```
