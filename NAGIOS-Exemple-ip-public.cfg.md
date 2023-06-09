<!-- MASTER-HEADER-START -->
<div align="center">

<a href="https://0xcyberlitech.com/">
  <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/headers/header-nagios.svg" alt="ATELIER NAGIOS // SUPERVISION RÉSEAU" width="100%" />
</a>

<p align="center">
  <a href="https://0xcyberlitech.com/"><img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-portal.svg" alt="Portail 0xCyberLiTech.com" width="24%" /></a>
  <a href="https://0xcyberlitech.com/soc-rd.html"><img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-soc-rd.svg" alt="Livre Blanc SOC Cockpit" width="24%" /></a>
  <a href="https://0xcyberlitech.com/jarvis-rd.html"><img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-jarvis-rd.svg" alt="Livre Blanc JARVIS IA" width="24%" /></a>
  <a href="https://github.com/0xCyberLiTech?tab=repositories"><img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-github.svg" alt="Catalogue des 23 Dépôts" width="24%" /></a>
</p>
<p align="center">
  <a href="README.md"><img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-back-readme.svg" alt="Retour au sommaire du dépôt" width="340" /></a>
</p>

<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/divider-hud.svg" alt="" width="100%" />
</div>
<!-- MASTER-HEADER-END -->

<!-- DEBIAN-TRUTH-START -->
> [!IMPORTANT]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-shield.svg" width="18" height="18" align="absmiddle" alt="" /> ** Matrice Officielle Debian — `Debian 12 (Bookworm)` · `Debian 13 (Trixie)` · `Debian 14 (Forky)`**
> - **Sources Officielles Debian.org (`monitoring-plugins`) :** `Bookworm (12)` : **`2.3.3-5+deb12u2`** &nbsp;·&nbsp; `Trixie (13 — Stable)` : **`2.4.0-3+deb13u1`** &nbsp;·&nbsp; `Forky (14 — Next-Gen)` : **`2.4.0-5`**
> - **Références Officielles :** [Paquet Debian Trixie (`monitoring-plugins`)](https://packages.debian.org/trixie/monitoring-plugins) &nbsp;·&nbsp; [Paquet Debian Forky (`monitoring-plugins`)](https://packages.debian.org/forky/monitoring-plugins) &nbsp;·&nbsp; [Documentation Officielle Debian](https://packages.debian.org/trixie/monitoring-plugins)
> - **Note d'Ingénierie (Divergence 13 vs 14) :** Sous Debian 13 (Trixie) et Debian 14 (Forky), `/tmp` étant monté en RAM (`tmpfs`), toute compilation des sources Nagios Core doit s'effectuer dans **`/usr/local/src`** et utiliser le métapaquet `php` (PHP 8.4+).

<details>
<summary><img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-doc.svg" width="18" height="18" align="absmiddle" alt="" /> <b>Afficher les Encarts Ligne de Commande : Debian 13 (Trixie — Stable) vs Debian 14 (Forky — Next-Gen)</b></summary>

#### <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-ok.svg" width="42" height="16" align="absmiddle" alt="[OK]" /> Profil Production Stable — Commandes pour `Debian 13 (Trixie)`
```bash
# Debian 13 (Trixie — PHP 8.4 & /tmp en RAM tmpfs) : Compiler dans /usr/local/src et non /tmp !
sudo mkdir -p /usr/local/src && cd /usr/local/src
sudo apt update && sudo apt install -y build-essential apache2 php libgd-dev unzip
```

#### <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-rd.svg" width="46" height="16" align="absmiddle" alt="[R&D]" /> Profil Anticipation Next-Gen — Commandes pour `Debian 14 (Forky)`
```bash
# Debian 14 (Forky) — Utilisation des metapaquets 'php' & 'libapache2-mod-php' sans numero fige :
sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
sudo systemctl restart nagios && sudo journalctl -u nagios -n 30
```

</details>
<!-- DEBIAN-TRUTH-END -->

<!-- CIEL-PEDAGOGY-START -->
<details>
<summary><img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-puzzle.svg" width="18" height="18" align="absmiddle" alt="" /> <b>Synthèse d'Architecture, Standards Officiels &amp; Diagnostic (Niveau 1 : Fondamentaux · Niveau 2 : Repères · Niveau 3 : Diagnostic)</b></summary>

- **Niveau 1 — Fondamentaux &amp; Principe d'Architecture :** **Nagios Core & NRPE** forment un moteur déterministe d'ordonnancement de sondes (*Plugins*) : chaque contrôle local ou distant retourne un code d'état POSIX normalisé (`0 = OK`, `1 = WARNING`, `2 = CRITICAL`, `3 = UNKNOWN`) déclenchant les escalades d'alertes.
- **Niveau 2 — Repères Officiels (Ports IANA, Fichiers Debian &amp; Commandes de Validation) :** **Ports IANA :** `TCP 5666` (Agent distant NRPE chiffré TLS) · `TCP 80/443` (Interface Web Apache2 CGI) &nbsp;|&nbsp; **Fichiers :** `/usr/local/nagios/etc/nagios.cfg`, `/etc/nagios/nrpe.cfg` &nbsp;|&nbsp; **Validation officielle :** `sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg`.
- **Niveau 3 — Diagnostic d'Incidents &amp; Ingénierie Avancée :** **Diagnostic & Architecture :** Une erreur `CHECK_NRPE: Could not complete SSL handshake` indique généralement que l'IP du serveur Nagios est absente de la directive `allowed_hosts=` dans `/etc/nagios/nrpe.cfg` sur l'hôte supervisé ou que le port `5666/tcp` est filtré.
- **Sources de Vérité Officielles Éditeurs &amp; Standards :** [Documentation Officielle Nagios Core 4](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/) &nbsp;·&nbsp; [Référentiel Officiel Nagios Plugins](https://nagios-plugins.org/)

</details>
<!-- CIEL-PEDAGOGY-END -->


## <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-plan.svg" width="18" height="18" align="absmiddle" alt="" /> 01 // Exemple concernant le fichier /usr/local/nagios/etc/objects/ip-public.cfg
<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-section-cyan.svg" width="100%" alt="" />

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```ini
>
> # --------------------------------------------------------------------------
> # 0xCyberLiTech
> # Date de création : le 10-07-2025
> # Date de modification : le 10-07-2025
> # IP-PUBLIC.CFG - Exemple de fichier de configuration pour Nagios.
> # /usr/local/nagios/etc/objects/ip-public.cfg
> # --------------------------------------------------------------------------
>
> # --------------------------------------------------------------------------
> # DEFINITION HOST - ip-public-free
> # --------------------------------------------------------------------------
> define host {
>
>      use                     generic-wan
>
>      host_name               ip-public-free
>      alias                   WAN Free 0.0.0.0    # Renseigner votre adresse ip fixe public
>      address                 0.0.0.0             # Renseigner votre adresse ip fixe public
>      hostgroups              grp-ip-public
>      #parents                router-02
> }
>
> # --------------------------------------------------------------------------
> # DEFINITION HOST - dns1-public-free - 212.27.40.240
> # --------------------------------------------------------------------------
> define host {
>
>      use                     generic-wan
>
>      host_name               dns1-public-free
>      alias                   DNS FAI Free 212.27.40.240
>      address                 212.27.40.240
>      hostgroups              grp-ip-public
>      #parents                router-02
> }
>
> # --------------------------------------------------------------------------
> # DEFINITION HOST - dns2-public-free - 212.27.40.241
> # --------------------------------------------------------------------------
> define host {
>
>      use                     generic-wan
>
>      host_name               dns2-public-free
>      alias                   DNS FAI Free 212.27.40.241
>      address                 212.27.40.241
>      hostgroups              grp-ip-public
>      #parents                router-02
> }
>
> # --------------------------------------------------------------------------
> # DEFINITION HOST GROUPS - grp-ip-public
> # --------------------------------------------------------------------------
> define hostgroup {
>
>      hostgroup_name          grp-ip-public
>      alias                   Host groups ip public
> }
>
> # --------------------------------------------------------------------------
> # DEFINITION SERVICE - ip-public-free - ping
> # --------------------------------------------------------------------------
> define service {
>
>      use                     generic-service
>      host_name               ip-public-free
>      service_description     PING
>      #check_command          check_ping!100.0,20%!500.0,60%
>      check_command           check_ping!900.0,40%!1500.0,70%
>      #check_command          check_ping!3000.0,80%!5000.0,100%
>      check_interval          5
>      retry_interval          1
> }
>
> # --------------------------------------------------------------------------
> # DEFINITION SERVICE - dns1-public-free - ping
> # --------------------------------------------------------------------------
> define service {
>
>      use                     generic-service
>      host_name               dns1-public-free
>      service_description     PING
>      #check_command          check_ping!100.0,20%!500.0,60%
>      check_command           check_ping!900.0,40%!1500.0,70%
>      #check_command          check_ping!3000.0,80%!5000.0,100%
>      check_interval          5
>      retry_interval          1
> }
>
> # --------------------------------------------------------------------------
> # DEFINITION SERVICE - dns2-public-free - ping
> # --------------------------------------------------------------------------
> define service {
>
>      use                     generic-service
>      host_name               dns2-public-free
>      service_description     PING
>      #check_command          check_ping!100.0,20%!500.0,60%
>      check_command           check_ping!900.0,40%!1500.0,70%
>      #check_command          check_ping!3000.0,80%!5000.0,100%
>      check_interval          5
>      retry_interval          1
> }
> ```
<!-- CODE-WINDOW-END -->

Nous allons tester notre nouvelle configuration que nous avons saisie dans le fichier /usr/local/nagios/etc/objects/ip-public.cfg à l'aide de la commande suivante :

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> # --------------------------------------------------------------------------
> # - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG -
> # --------------------------------------------------------------------------
> /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
>
> Checking objects...
>         Checked 10 services.
>         Checked 3 hosts.
>         Checked 2 host groups.
>         Checked 0 service groups.
>         Checked 1 contacts.
>         Checked 1 contact groups.
>         Checked 24 commands.
>         Checked 5 time periods.
>         Checked 0 host escalations.
>         Checked 0 service escalations.
> Checking for circular paths...
>         Checked 3 hosts
>         Checked 0 service dependencies
>         Checked 0 host dependencies
>         Checked 5 timeperiods
> Checking global event handlers...
> Checking obsessive compulsive processor commands...
> Checking misc settings...
>
> Total Warnings: 0
> Total Errors:   0
> ```
<!-- CODE-WINDOW-END -->

Si il n'y a pas d'erreur sur cette nouvelle configuration (ip-public.cfg), redémarrer Nagios pour la prise en compte de cette nouvelle configuration.

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> systemctl restart nagios.service
> ```
<!-- CODE-WINDOW-END -->

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> systemctl status nagios.service
>
> ● nagios.service - Nagios Core 4.4.13
>      Loaded: loaded (/lib/systemd/system/nagios.service; enabled; preset: enabled)
>      Active: active (running) since Sun 2023-06-25 10:45:29 CEST; 8s ago
>        Docs: https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/
>     Process: 13282 ExecStartPre=/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg (code=exited, status=0/SUCCESS)
>     Process: 13283 ExecStart=/usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg (code=exited, status=0/SUCCESS)
>    Main PID: 13284 (nagios)
>       Tasks: 12 (limit: 4644)
>      Memory: 7.9M
>         CPU: 115ms
>      CGroup: /system.slice/nagios.service
>              ├─13284 /usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg
>              ├─13285 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
>              ├─13286 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
>              ├─13287 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
>              ├─13288 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
>              ├─13289 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
>              ├─13290 /usr/local/nagios/bin/nagios --worker /usr/local/nagios/var/rw/nagios.qh
>              ├─13291 /usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg
>              ├─13292 /usr/local/nagios/libexec/check_ping -H 192.168.50.200 -w 100.0,20% -c 500.0,60% -p 5
>              ├─13293 /usr/bin/ping -n -U -w 10 -c 5 192.168.50.200
>              ├─13295 /usr/local/nagios/libexec/check_ping -H 192.168.50.110 -w 100.0,20% -c 500.0,60% -p 5
>              └─13297 /usr/bin/ping -n -U -w 10 -c 5 192.168.50.110
> ```
<!-- CODE-WINDOW-END -->

<!-- MASTER-FOOTER-START -->
<div align="center">
<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/divider-hud.svg" alt="" width="100%" />

<a href="https://0xcyberlitech.com/">
  <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/footer-master.svg" alt="0xCyberLiTech — Architecture Cyberdéfense, Ingénierie Déterministe & IA Souveraine" width="100%" />
</a>

<p align="center"><a href="https://0xcyberlitech.com/"><img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/badge-antigravity.svg" alt="Architecturé par Marc & Antigravity (Google DeepMind)" width="520" /></a></p>

<sub><b>Architecturé &amp; Forgé par Marc &amp; Antigravity (Google DeepMind)</b> &nbsp;·&nbsp; <a href="https://0xcyberlitech.com/"><b>0xcyberlitech.com</b></a> &nbsp;·&nbsp; <a href="https://0xcyberlitech.com/soc-rd.html">Architecture SOC Cockpit v5.5</a> &nbsp;·&nbsp; <a href="https://0xcyberlitech.com/jarvis-rd.html">Architecture JARVIS Mark-VII</a> &nbsp;·&nbsp; <a href="https://0xcyberlitech.com/blueprint-jarvis.html">Blueprint Matériel RTX 5080</a></sub>

</div>
<!-- MASTER-FOOTER-END -->
