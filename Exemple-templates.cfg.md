## Exemple concernant le fichier /usr/local/nagios/etc/objects/templates.cfg
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

    name                            generic-contact         ; The name of this contact template
    service_notification_period     24x7                    ; service notifications can be sent anytime
    host_notification_period        24x7                    ; host notifications can be sent anytime
    service_notification_options    w,u,c,r,f,s             ; send notifications for all service states, flapping events, and scheduled downtime events
    host_notification_options       d,u,r,f,s               ; send notifications for all host states, flapping events, and scheduled downtime events
    service_notification_commands   notify-service-by-email ; send service notifications via email
    host_notification_commands      notify-host-by-email    ; send host notifications via email
    register                        0                       ; DON'T REGISTER THIS DEFINITION - ITS NOT A REAL CONTACT, JUST A TEMPLATE!
}

# --------------------------------------------------------------------------
# HOST TEMPLATES
# --------------------------------------------------------------------------
# Generic host definition template
# This is NOT a real host, just a template!

define host {

    name                            generic-host            ; The name of this host template
    notifications_enabled           1                       ; Host notifications are enabled
    event_handler_enabled           1                       ; Host event handler is enabled
    flap_detection_enabled          1                       ; Flap detection is enabled
    process_perf_data               1                       ; Process performance data
    retain_status_information       1                       ; Retain status information across program restarts
    retain_nonstatus_information    1                       ; Retain non-status information across program restarts
    notification_period             24x7                    ; Send host notifications at any time
    register                        0                       ; DON'T REGISTER THIS DEFINITION - ITS NOT A REAL HOST, JUST A TEMPLATE!
}

# Linux host definition template
# This is NOT a real host, just a template!

define host {

    name                            linux-server            ; The name of this host template
    use                             generic-host            ; This template inherits other values from the generic-host temp$
    check_period                    24x7                    ; By default, Linux hosts are checked round the clock
    check_interval                  5                       ; Actively check the host every 5 minutes
    retry_interval                  1                       ; Schedule host check retries at 1 minute intervals
    max_check_attempts              10                      ; Check each Linux host 10 times (max)
    check_command                   check-host-alive        ; Default command to check Linux hosts
    notification_period             workhours               ; Linux admins hate to be woken up, so we only notify during the$
                                                            ; Note that the notification_period variable is being overridden$
                                                            ; the value that is inherited from the generic-host template!
    notification_interval           120                     ; Resend notifications every 2 hours
    notification_options            d,u,r                   ; Only send notifications for specific host states
    contact_groups                  admins                  ; Notifications get sent to the admins by default
    register                        0                       ; DON'T REGISTER THIS DEFINITION - ITS NOT A REAL HOST, JUST A T$
}

# Windows host definition template
# This is NOT a real host, just a template!

define host {

    name                            windows-server          ; The name of this host template
    use                             generic-host            ; Inherit default values from the generic-host template
    check_period                    24x7                    ; By default, Windows servers are monitored round the clock
    check_interval                  5                       ; Actively check the server every 5 minutes
    retry_interval                  1                       ; Schedule host check retries at 1 minute intervals
    max_check_attempts              10                      ; Check each server 10 times (max)
    check_command                   check-host-alive        ; Default command to check if servers are "alive"
    notification_period             24x7                    ; Send notification out at any time - day or night
    notification_interval           30                      ; Resend notifications every 30 minutes
    notification_options            d,r                     ; Only send notifications for specific host states
    contact_groups                  admins                  ; Notifications get sent to the admins by default
    hostgroups                      windows-servers         ; Host groups that Windows servers should be a member of
    register                        0                       ; DON'T REGISTER THIS - ITS JUST A TEMPLATE
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

    name                            generic-service         ; The 'name' of this service template
    active_checks_enabled           1                       ; Active service checks are enabled
    passive_checks_enabled          1                       ; Passive service checks are enabled/accepted
    parallelize_check               1                       ; Active service checks should be parallelized (disabling this can lead to major performance problems)
    obsess_over_service             1                       ; We should obsess over this service (if necessary)
    check_freshness                 0                       ; Default is to NOT check service 'freshness'
    notifications_enabled           1                       ; Service notifications are enabled
    event_handler_enabled           1                       ; Service event handler is enabled
    flap_detection_enabled          1                       ; Flap detection is enabled
    process_perf_data               1                       ; Process performance data
    retain_status_information       1                       ; Retain status information across program restarts
    retain_nonstatus_information    1                       ; Retain non-status information across program restarts
    is_volatile                     0                       ; The service is not volatile
    check_period                    24x7                    ; The service can be checked at any time of the day
    max_check_attempts              3                       ; Re-check the service up to 3 times in order to determine its final (hard) state
    check_interval                  10                      ; Check the service every 10 minutes under normal conditions
    retry_interval                  2                       ; Re-check the service every two minutes until a hard state can be determined
    contact_groups                  admins                  ; Notifications get sent out to everyone in the 'admins' group
    notification_options            w,u,c,r                 ; Send notifications about warning, unknown, critical, and recovery events
    notification_interval           60                      ; Re-notify about service problems every hour
    notification_period             24x7                    ; Notifications can be sent out at any time
    register                        0                       ; DON'T REGISTER THIS DEFINITION - ITS NOT A REAL SERVICE, JUST A TEMPLATE!
}

# Local service definition template
# This is NOT a real service, just a template!

define service {

    name                            local-service           ; The name of this service template
    use                             generic-service         ; Inherit default values from the generic-service definition
    max_check_attempts              4                       ; Re-check the service up to 4 times in order to determine its final (hard) state
    check_interval                  5                       ; Check the service every 5 minutes under normal conditions
    retry_interval                  1                       ; Re-check the service every minute until a hard state can be determined
    register                        0                       ; DONT REGISTER THIS DEFINITION - ITS NOT A REAL SERVICE, JUST A TEMPLATE!
}
```
