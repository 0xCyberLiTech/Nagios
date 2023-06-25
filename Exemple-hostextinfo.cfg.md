<a name="Exemple-hostextinfo.cfg.md"></a>

## - C. Exemple concernant le fichier /usr/local/nagios/etc/objects/hostextinfo.cfg

#### Introduction :

##### De base, tous les hosts de la cartographie ont pour symbole un point. 
##### Nagios permet d'afficher une icône différente pour chaque hosts. 
##### Les images et icônes proposées par défaut se trouve dans /usr/local/nagios/share/images/logos/.

```
cd /usr/local/nagios/share/images/logos/
ls -L

aix.gd2        caldera.jpg         freebsd40.gif        ip-pbx.gif     mandrake.png     novell40.gif     router.gd2     storm.png        thin-client.gif   win40.gd2
aix.gif        caldera.png         freebsd40.jpg        irix.gd2       monitor.png      novell40.jpg     router.gif     sun40.gd2        turbolinux.gd2    win40.gif
aix.jpg        cat1900.gd2         freebsd40.png        irix.gif       nagios.gd2       novell40.png     san.gd2        sun40.gif        turbolinux.gif    win40.jpg
aix.png        cat2900.gd2         globe.png            irix.jpg       nagios.gif       openbsd.gd2      san.gif        sun40.jpg        turbolinux.jpg    win40.png
amiga.gd2      cat5000.gd2         graph.gif            irix.png       nagiosvrml.png   openbsd.gif      satellite.png  sun40.png        turbolinux.png    workstation.gd2
amiga.gif      database.gd2        hp-printer40.gd2     linux40.gd2    netbsd.gif       openbsd.jpg      server.png     sunlogo.gd2      ultrapenguin.gd2  workstation.gif
amiga.jpg      database.gif        hp-printer40.gif     linux40.gif    netbsd.jpg       openbsd.png      signal.png     sunlogo.gif      ultrapenguin.gif  workstation_locked.png
amiga.png      debian.gd2          hp-printer40.jpg     linux40.jpg    netbsd.png       printer.gd2      slackware.gd2  sunlogo.jpg      ultrapenguin.jpg  workstation.png
apple.gd2      debian.gif          hp-printer40.png     linux40.png    next.gd2         printer.gif      slackware.gif  sunlogo.png      ultrapenguin.png  yellowdog.gd2
apple.gif      debian.jpg          hpux.gd2             logo.gd2       next.gif         rack-server.gd2  slackware.jpg  suse.gif         unicos.gd2        yellowdog.gif
apple.jpg      debian.png          hpux.gif             mac40.gd2      next.jpg         rack-server.gif  slackware.png  suse.jpg         unicos.gif        yellowdog.jpg
apple.png      desktop-server.gd2  hpux.jpg             mac40.gif      next.png         redhat.gd2       stampede.gd2   suse.png         unicos.jpg        yellowdog.png
beos.gd2       desktop-server.gif  hpux.png             mac40.jpg      ng-switch40.gd2  redhat.gif       stampede.gif   switch40.gd2     unicos.png
beos.gif       ethernet_card.png   hub.gd2              mac40.png      ng-switch40.gif  redhat.jpg       stampede.jpg   switch40.gif     unknown.gd2
beos.jpg       fax.gd2             hub.gif              mainframe.gd2  ng-switch40.jpg  redhat.png       stampede.png   switch40.jpg     unknown.gif
beos.png       fax.gif             internet_device.png  mainframe.gif  ng-switch40.png  router40.gd2     station.gd2    switch40.png     webcamera.png
bluetooth.png  firewall.gd2        internet.gd2         mandrake.gd2   notebook.gd2     router40.gif     storm.gd2      switch.gd2       wifi.gd2
caldera.gd2    firewall.gif        internet.gif         mandrake.gif   notebook.gif     router40.jpg     storm.gif      switch.gif       wifi.gif
caldera.gif    freebsd40.gd2       ip-pbx.gd2           mandrake.jpg   novell40.gd2     router40.png     storm.jpg      thin-client.gd2  wifi_modem.png
```

##### Vous pouvez bien entendu rajouter autant de logos que vous voulez. Certains sites devraient vous permettre de trouver votre bonheur.
##### Une fois que nous savons ça, il ne reste plus qu’à renseigner le fichier hostextinfo.cfg.

#### Il est donc nécessaire de déclarer ce fichier dans /usr/local/nagios/etc/nagios.cfg.

```
Exemple :

cfg_file=/usr/local/nagios/etc/objects/serveurs-linux.cfg
#cfg_file=/usr/local/nagios/etc/objects/serveurs-windows.cfg
#cfg_file=/usr/local/nagios/etc/objects/routeurs.cfg
#cfg_file=/usr/local/nagios/etc/objects/imprimantes.cfg
# --------------------------------------------------------------------------
cfg_file=/usr/local/nagios/etc/objects/hostextinfo.cfg
# --------------------------------------------------------------------------
```
#### Nous allons pouvoir créer celui-ci dans /usr/local/nagios/etc/objects/

```
touch /usr/local/nagios/etc/objects/hostextinfo.cfg
```
#### Nous allons repositionner les droits qui conviennent sur ce fichier.

```
chown nagios:nagios /usr/local/nagios/etc/objects/hostextinfo.cfg
```
#### Saisir le code ci-dessous en guise d'exemple dans le fichier hostextinfo.cfg.
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 25-06-2023
# HOSTEXTINFO.CFG - Exemple de fichier de configuration pour Nagios
# /usr/local/nagios/etc/objects/hostextinfo.cfg
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - srv-linux-01
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   srv-linux-01
    notes                       (1) Serveur Linux
    #notes_url                  https://0.0.0.0:0000
    #action_url                 https://0.0.0.0:0000
    icon_image_alt              (1) Serveur Linux
    icon_image                  linux40.gif
    statusmap_image             linux40.gd2
    vrml_image                  linux40.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - srv-linux-02
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   srv-linux-02
    notes                       (2) Serveur Linux
    #notes_url                  https://0.0.0.0:0000
    #action_url                 https://0.0.0.0:0000
    icon_image_alt              (2) Serveur Linux
    icon_image                  linux40.gif
    statusmap_image             linux40.gd2
    vrml_image                  linux40.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - router-01
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   router-01
    notes                       (1) Router
    #notes_url                  https://0.0.0.0:0000
    #action_url                 https://0.0.0.0:0000
    icon_image_alt              (1) Asus GT AXE-16000
    icon_image                  router40.gif
    statusmap_image             router40.gd2
    vrml_image                  router40.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - router-02
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   router-02
    notes                       (2) Router
    #notes_url                  https://0.0.0.0:0000
    #action_url                 https://0.0.0.0:0000
    icon_image_alt              (2) Freebox DELTA
    icon_image                  router40.gif
    statusmap_image             router40.gd2
    vrml_image                  router40.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - mesh-wifi-A
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   mesh-wifi-A
    notes                       (A) Router wifi Mesh
    #notes_url                  https://0.0.0.0:0000
    #action_url                 https://0.0.0.0:0000
    icon_image_alt              (A) Zen Wifi ET-12
    icon_image                  router40.gif
    statusmap_image             router40.gd2
    vrml_image                  router40.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - mesh-wifi-B
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   mesh-wifi-B
    notes                       (B) Router wifi Mesh
    #notes_url                  https://0.0.0.0:0000
    #action_url                 https://0.0.0.0:0000
    icon_image_alt              (B) Zen Wifi ET-12
    icon_image                  router40.gif
    statusmap_image             router40.gd2
    vrml_image                  router40.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - ip-public-free
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   ip-public-free
    notes                       (1) FAI Free
    #notes_url                  https://0.0.0.0:0000
    #action_url                 https://0.0.0.0:0000
    icon_image_alt              (1) FAI Free
    icon_image                  internet.gif
    statusmap_image             internet.gd2
    vrml_image                  internet.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - dns1-public-free
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   dns1-public-free
    notes                       (1) FAI Free DNS 1
    #notes_url                  https://0.0.0.0:0000
    #action_url                 https://0.0.0.0:0000
    icon_image_alt              (1) FAI Free DNS 1
    icon_image                  internet.gif
    statusmap_image             internet.gd2
    vrml_image                  internet.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}

# --------------------------------------------------------------------------
# HOSTEXTINFO DEFINITION - dns2-public-free
# --------------------------------------------------------------------------
define hostextinfo{

    host_name                   dns2-public-free
    notes                       (1) FAI Free DNS 2
    #notes_url                  https://0.0.0.0:0000
    #action_url                 https://0.0.0.0:0000
    icon_image_alt              (1) FAI Free DNS 2
    icon_image                  internet.gif
    statusmap_image             internet.gd2
    vrml_image                  internet.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}
```
Nous allons tester notre nouvelle configuration que nous avons saisie dans le fichier /usr/local/nagios/etc/objects/router.cfg à l'aide de la commande suivante :
```
# --------------------------------------------------------------------------
# - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG - MOD DEBUG -
# --------------------------------------------------------------------------
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/hostextinfo.cfg

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
#### Si il n'y a pas d'erreur sur cette nouvelle configuration (hostextinfo.cfg), redémarrer Nagios pour la prise en compte de cette nouvelle configuration.
```
systemctl restart nagios.service
```

