<a name="Exemple-templates.cfg.md"></a>
![Nagios](./images/nagios.png)

## - Exemple concernant le fichier /usr/local/nagios/etc/objects/templates.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 25-06-2023
# TEMPLATES.CFG - Exemple de fichier de configuration pour Nagios.
# /usr/local/nagios/etc/objects/templates.cfg
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# CONTACT TEMPLATES
# --------------------------------------------------------------------------
# Generic contact definition template
# This is NOT a real contact, just a templates
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
# HOST TEMPLATE
# --------------------------------------------------------------------------
# Generic host definition template
# This is NOT a real host, just a template!
# --------------------------------------------------------------------------
# HOST TEMPLATE (generic-host)
# --------------------------------------------------------------------------
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

# --------------------------------------------------------------------------
# HOST TEMPLATE (linux-server)
# --------------------------------------------------------------------------
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

# --------------------------------------------------------------------------
# HOST TEMPLATE (windows-server))
# --------------------------------------------------------------------------
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

# --------------------------------------------------------------------------
# HOST TEMPLATE (generic-printer)
# --------------------------------------------------------------------------
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

# --------------------------------------------------------------------------
# HOST TEMPLATE (generic-switch)
# --------------------------------------------------------------------------
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

# --------------------------------------------------------------------------
# HOST TEMPLATE (generic-router)
# --------------------------------------------------------------------------
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

# --------------------------------------------------------------------------
# HOST TEMPLATE (generic-wan)
# --------------------------------------------------------------------------
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
# --------------------------------------------------------------------------
# SERVICE TEMPLATES (generic-service)
# --------------------------------------------------------------------------
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

# --------------------------------------------------------------------------
# SERVICE TEMPLATES (local-service)
# --------------------------------------------------------------------------
# Local service definition template
# This is NOT a real service, just a template!
define service {

    name                            local-service
    use                             generic-service
    max_check_attempts              4
    check_interval                  5
    retry_interval                  1
    register                        0
}
```
Nous allons tester notre nouvelle configuration que nous avons saisie dans le fichier /usr/local/nagios/etc/objects/templates.cfg à l'aide de la commande suivante :
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
Si il n'y a pas d'erreur sur cette nouvelle configuration (templates.cfg), redémarrer Nagios pour la prise en compte de cette nouvelle configuration.
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
