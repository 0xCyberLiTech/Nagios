<div align="center">
  
  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3ESUPERVISION+NAGIOS_" alt="Titre dynamique SUPERVISION NAGIOS" />
  </a>
  
  <br></br>

  <h2>Laboratoire numérique pour la cybersécurité, Linux & IT</h2>

  <p align="center">
    <a href="https://0xcyberlitech.github.io/">
      <img src="https://img.shields.io/badge/Portfolio-0xCyberLiTech-181717?logo=github&style=flat-square" alt="🌐 Portfolio" />
    </a>
    <a href="https://github.com/0xCyberLiTech">
      <img src="https://img.shields.io/badge/Profil-GitHub-181717?logo=github&style=flat-square" alt="🔗 Profil GitHub" />
    </a>
    <a href="https://github.com/0xCyberLiTech/Nagios/releases/latest">
      <img src="https://img.shields.io/github/v/release/0xCyberLiTech/Nagios?label=version&style=flat-square&color=blue" alt="📦 Dernière version" />
    </a>
    <a href="https://github.com/0xCyberLiTech/Nagios/blob/main/CHANGELOG.md">
      <img src="https://img.shields.io/badge/📄%20Changelog-Nagios-blue?style=flat-square" alt="📄 CHANGELOG Nagios" />
    </a>
    <a href="https://github.com/0xCyberLiTech?tab=repositories">
      <img src="https://img.shields.io/badge/Dépôts-publics-blue?style=flat-square" alt="📂 Dépôts publics" />
    </a>
    <a href="https://github.com/0xCyberLiTech/Nagios/graphs/contributors">
      <img src="https://img.shields.io/badge/👥%20Contributeurs-cliquez%20ici-007ec6?style=flat-square" alt="👥 Contributeurs Nagios" />
    </a>
  </p>

</div>

<!--
Optimisation SEO : mots-clés Nagios, 0xCyberLiTech, supervision informatique, monitoring, Nagios, administration système, sécurité informatique, Linux, Debian, tutoriels supervision, guides monitoring, alertes réseau, performance réseau, open source, ressources techniques, IT, professionnels, étudiants, passionnés, gestion d’infrastructure, surveillance réseau, outils de supervision.
-->

<div align="center">
  <img src="https://img.icons8.com/fluency/96/000000/cyber-security.png" alt="CyberSec" width="80"/>
</div>

<div align="center">
  <p>
    <strong>Cybersécurité</strong> <img src="https://img.icons8.com/color/24/000000/lock--v1.png"/> • <strong>Linux Debian</strong> <img src="https://img.icons8.com/color/24/000000/linux.png"/> • <strong>Sécurité informatique</strong> <img src="https://img.icons8.com/color/24/000000/shield-security.png"/>
  </p>
</div>

---

## 🚀 À propos & Objectifs

Ce projet propose des solutions innovantes et accessibles en cybersécurité, avec une approche centrée sur la simplicité d’utilisation et l’efficacité. Il vise à accompagner les utilisateurs dans la protection de leurs données et systèmes, tout en favorisant l’apprentissage et le partage des connaissances.

Le contenu est structuré, accessible et optimisé SEO pour répondre aux besoins de :
- 🎓 Étudiants : approfondir les connaissances
- 👨‍💻 Professionnels IT : outils et pratiques
- 🖥️ Administrateurs système : sécuriser l’infrastructure
- 🛡️ Experts cybersécurité : ressources techniques
- 🚀 Passionnés du numérique : explorer les bonnes pratiques

---

## Exemple concernant le fichier /usr/local/nagios/etc/objects/templates.cfg

```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 10-07-2025
# Date de modification : le 10-07-2025
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

---

<div align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="440">
  </a>
</div>

<p align="center">
  <b>🔐 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour une cybersécurité compréhensible et efficace. 🔐</b>
</p>
