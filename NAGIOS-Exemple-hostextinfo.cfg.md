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
- **Livres Blancs &amp; 67 Podcasts Audio R&amp;D :** [Portail 0xCyberLiTech](https://0xcyberlitech.com/) &nbsp;·&nbsp; [Livre Blanc SOC Cockpit v5.5](https://0xcyberlitech.com/soc-rd.html) &nbsp;·&nbsp; [Livre Blanc JARVIS Mark-VII](https://0xcyberlitech.com/jarvis-rd.html) &nbsp;·&nbsp; [Blueprint Logiciel &amp; Matériel RTX 5080](https://0xcyberlitech.com/blueprint-jarvis.html)

</details>
<!-- CIEL-PEDAGOGY-END -->


## <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-plan.svg" width="18" height="18" align="absmiddle" alt="" /> 01 // Exemple concernant le fichier /usr/local/nagios/etc/objects/hostextinfo.cfg
<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-section-cyan.svg" width="100%" alt="" />

Introduction :

De base, tous les hosts de la cartographie ont pour symbole un point. 
Nagios permet d'afficher une icône différente pour chaque hosts. 
Les images et icônes proposées par défaut se trouve dans /usr/local/nagios/share/images/logos/.

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> cd /usr/local/nagios/share/images/logos/
> ls -L
>
> aix.gd2        caldera.jpg         freebsd40.gif        ip-pbx.gif     mandrake.png     novell40.gif     router.gd2     storm.png        thin-client.gif   win40.gd2
> aix.gif        caldera.png         freebsd40.jpg        irix.gd2       monitor.png      novell40.jpg     router.gif     sun40.gd2        turbolinux.gd2    win40.gif
> aix.jpg        cat1900.gd2         freebsd40.png        irix.gif       nagios.gd2       novell40.png     san.gd2        sun40.gif        turbolinux.gif    win40.jpg
> aix.png        cat2900.gd2         globe.png            irix.jpg       nagios.gif       openbsd.gd2      san.gif        sun40.jpg        turbolinux.jpg    win40.png
> amiga.gd2      cat5000.gd2         graph.gif            irix.png       nagiosvrml.png   openbsd.gif      satellite.png  sun40.png        turbolinux.png    workstation.gd2
> amiga.gif      database.gd2        hp-printer40.gd2     linux40.gd2    netbsd.gif       openbsd.jpg      server.png     sunlogo.gd2      ultrapenguin.gd2  workstation.gif
> amiga.jpg      database.gif        hp-printer40.gif     linux40.gif    netbsd.jpg       openbsd.png      signal.png     sunlogo.gif      ultrapenguin.gif  workstation_locked.png
> amiga.png      debian.gd2          hp-printer40.jpg     linux40.jpg    netbsd.png       printer.gd2      slackware.gd2  sunlogo.jpg      ultrapenguin.jpg  workstation.png
> apple.gd2      debian.gif          hp-printer40.png     linux40.png    next.gd2         printer.gif      slackware.gif  sunlogo.png      ultrapenguin.png  yellowdog.gd2
> apple.gif      debian.jpg          hpux.gd2             logo.gd2       next.gif         rack-server.gd2  slackware.jpg  suse.gif         unicos.gd2        yellowdog.gif
> apple.jpg      debian.png          hpux.gif             mac40.gd2      next.jpg         rack-server.gif  slackware.png  suse.jpg         unicos.gif        yellowdog.jpg
> apple.png      desktop-server.gd2  hpux.jpg             mac40.gif      next.png         redhat.gd2       stampede.gd2   suse.png         unicos.jpg        yellowdog.png
> beos.gd2       desktop-server.gif  hpux.png             mac40.jpg      ng-switch40.gd2  redhat.gif       stampede.gif   switch40.gd2     unicos.png
> beos.gif       ethernet_card.png   hub.gd2              mac40.png      ng-switch40.gif  redhat.jpg       stampede.jpg   switch40.gif     unknown.gd2
> beos.jpg       fax.gd2             hub.gif              mainframe.gd2  ng-switch40.jpg  redhat.png       stampede.png   switch40.jpg     unknown.gif
> beos.png       fax.gif             internet_device.png  mainframe.gif  ng-switch40.png  router40.gd2     station.gd2    switch40.png     webcamera.png
> bluetooth.png  firewall.gd2        internet.gd2         mandrake.gd2   notebook.gd2     router40.gif     storm.gd2      switch.gd2       wifi.gd2
> caldera.gd2    firewall.gif        internet.gif         mandrake.gif   notebook.gif     router40.jpg     storm.gif      switch.gif       wifi.gif
> caldera.gif    freebsd40.gd2       ip-pbx.gd2           mandrake.jpg   novell40.gd2     router40.png     storm.jpg      thin-client.gd2  wifi_modem.png
> ```
<!-- CODE-WINDOW-END -->

Vous pouvez bien entendu rajouter autant de logos que vous voulez. Certains sites devraient vous permettre de trouver votre bonheur.
Une fois que nous savons ça, il ne reste plus qu’à renseigner le fichier hostextinfo.cfg.

Il est donc nécessaire de déclarer ce fichier dans /usr/local/nagios/etc/nagios.cfg.

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```ini
> Exemple :
>
> cfg_file=/usr/local/nagios/etc/objects/serveurs-linux.cfg
> #cfg_file=/usr/local/nagios/etc/objects/serveurs-windows.cfg
> #cfg_file=/usr/local/nagios/etc/objects/routeurs.cfg
> #cfg_file=/usr/local/nagios/etc/objects/imprimantes.cfg
> # --------------------------------------------------------------------------
> cfg_file=/usr/local/nagios/etc/objects/hostextinfo.cfg
> # --------------------------------------------------------------------------
> ```
<!-- CODE-WINDOW-END -->

Nous allons pouvoir créer celui-ci dans /usr/local/nagios/etc/objects/

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> touch /usr/local/nagios/etc/objects/hostextinfo.cfg
> ```
<!-- CODE-WINDOW-END -->

Nous allons repositionner les droits qui conviennent sur ce fichier.

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> chown nagios:nagios /usr/local/nagios/etc/objects/hostextinfo.cfg
> ```
<!-- CODE-WINDOW-END -->

Saisir le code ci-dessous en guise d'exemple dans le fichier hostextinfo.cfg.

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```ini
> # --------------------------------------------------------------------------
> # 0xCyberLiTech
> # Date de création : le 10-07-2025
> # Date de modification : le 10-07-2025
> # HOSTEXTINFO.CFG - Exemple de fichier de configuration pour Nagios
> # /usr/local/nagios/etc/objects/hostextinfo.cfg
> # --------------------------------------------------------------------------
>
> # --------------------------------------------------------------------------
> # HOSTEXTINFO DEFINITION - srv-linux-01
> # --------------------------------------------------------------------------
> define hostextinfo{
>
>     host_name                   srv-linux-01
>     notes                       (1) Serveur Linux
>     #notes_url                  https://0.0.0.0:0000
>     #action_url                 https://0.0.0.0:0000
>     icon_image_alt              (1) Serveur Linux
>     icon_image                  linux40.gif
>     statusmap_image             linux40.gd2
>     vrml_image                  linux40.gif
>     #2d_coords                  400,600
>     #3d_coords                  100.0,50.0,75.0
> }
>
> # --------------------------------------------------------------------------
> # HOSTEXTINFO DEFINITION - srv-linux-02
> # --------------------------------------------------------------------------
> define hostextinfo{
>
>     host_name                   srv-linux-02
>     notes                       (2) Serveur Linux
>     #notes_url                  https://0.0.0.0:0000
>     #action_url                 https://0.0.0.0:0000
>     icon_image_alt              (2) Serveur Linux
>     icon_image                  linux40.gif
>     statusmap_image             linux40.gd2
>     vrml_image                  linux40.gif
>     #2d_coords                  400,600
>     #3d_coords                  100.0,50.0,75.0
> }
>
> # --------------------------------------------------------------------------
> # HOSTEXTINFO DEFINITION - router-01
> # --------------------------------------------------------------------------
> define hostextinfo{
>
>     host_name                   router-01
>     notes                       (1) Router
>     #notes_url                  https://0.0.0.0:0000
>     #action_url                 https://0.0.0.0:0000
>     icon_image_alt              (1) Asus GT AXE-16000
>     icon_image                  router40.gif
>     statusmap_image             router40.gd2
>     vrml_image                  router40.gif
>     #2d_coords                  400,600
>     #3d_coords                  100.0,50.0,75.0
> }
>
> # --------------------------------------------------------------------------
> # HOSTEXTINFO DEFINITION - router-02
> # --------------------------------------------------------------------------
> define hostextinfo{
>
>     host_name                   router-02
>     notes                       (2) Router
>     #notes_url                  https://0.0.0.0:0000
>     #action_url                 https://0.0.0.0:0000
>     icon_image_alt              (2) Freebox DELTA
>     icon_image                  router40.gif
>     statusmap_image             router40.gd2
>     vrml_image                  router40.gif
>     #2d_coords                  400,600
>     #3d_coords                  100.0,50.0,75.0
> }
>
> # --------------------------------------------------------------------------
> # HOSTEXTINFO DEFINITION - mesh-wifi-A
> # --------------------------------------------------------------------------
> define hostextinfo{
>
>     host_name                   mesh-wifi-A
>     notes                       (A) Router wifi Mesh
>     #notes_url                  https://0.0.0.0:0000
>     #action_url                 https://0.0.0.0:0000
>     icon_image_alt              (A) Zen Wifi ET-12
>     icon_image                  router40.gif
>     statusmap_image             router40.gd2
>     vrml_image                  router40.gif
>     #2d_coords                  400,600
>     #3d_coords                  100.0,50.0,75.0
> }
>
> # --------------------------------------------------------------------------
> # HOSTEXTINFO DEFINITION - mesh-wifi-B
> # --------------------------------------------------------------------------
> define hostextinfo{
>
>     host_name                   mesh-wifi-B
>     notes                       (B) Router wifi Mesh
>     #notes_url                  https://0.0.0.0:0000
>     #action_url                 https://0.0.0.0:0000
>     icon_image_alt              (B) Zen Wifi ET-12
>     icon_image                  router40.gif
>     statusmap_image             router40.gd2
>     vrml_image                  router40.gif
>     #2d_coords                  400,600
>     #3d_coords                  100.0,50.0,75.0
> }
>
> # --------------------------------------------------------------------------
> # HOSTEXTINFO DEFINITION - ip-public-free
> # --------------------------------------------------------------------------
> define hostextinfo{
>
>     host_name                   ip-public-free
>     notes                       (1) FAI Free
>     #notes_url                  https://0.0.0.0:0000
>     #action_url                 https://0.0.0.0:0000
>     icon_image_alt              (1) FAI Free
>     icon_image                  internet.gif
>     statusmap_image             internet.gd2
>     vrml_image                  internet.gif
>     #2d_coords                  400,600
>     #3d_coords                  100.0,50.0,75.0
> }
>
> # --------------------------------------------------------------------------
> # HOSTEXTINFO DEFINITION - dns1-public-free
> # --------------------------------------------------------------------------
> define hostextinfo{
>
>     host_name                   dns1-public-free
>     notes                       (1) FAI Free DNS 1
>     #notes_url                  https://0.0.0.0:0000
>     #action_url                 https://0.0.0.0:0000
>     icon_image_alt              (1) FAI Free DNS 1
>     icon_image                  internet.gif
>     statusmap_image             internet.gd2
>     vrml_image                  internet.gif
>     #2d_coords                  400,600
>     #3d_coords                  100.0,50.0,75.0
> }
>
> # --------------------------------------------------------------------------
> # HOSTEXTINFO DEFINITION - dns2-public-free
> # --------------------------------------------------------------------------
> define hostextinfo{
>
>     host_name                   dns2-public-free
>     notes                       (1) FAI Free DNS 2
>     #notes_url                  https://0.0.0.0:0000
>     #action_url                 https://0.0.0.0:0000
>     icon_image_alt              (1) FAI Free DNS 2
>     icon_image                  internet.gif
>     statusmap_image             internet.gd2
>     vrml_image                  internet.gif
>     #2d_coords                  400,600
>     #3d_coords                  100.0,50.0,75.0
> }
> ```
<!-- CODE-WINDOW-END -->

Nous allons tester notre nouvelle configuration que nous avons saisie dans le fichier /usr/local/nagios/etc/objects/hostextinfo.cfg à l'aide de la commande suivante :

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

Si il n'y a pas d'erreur sur cette nouvelle configuration (hostextinfo.cfg), redémarrer Nagios pour la prise en compte de cette nouvelle configuration.

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
