
## Exemple concernant le fichier /usr/local/nagios/etc/hostextinfo.cfg

```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 21-06-2023
# HOSTEXTINFO.CFG - Exemple de fichier de configuration pour Nagios
# --------------------------------------------------------------------------


define hostextinfo{

    host_name                   serveur-linux-01
    notes                       (1) Serveur Linux
    #notes_url                  https://10.111.111.111:8443
    #action_url                 https://10.111.111.111:8444
    icon_image_alt              (1) Serveur Linux
    icon_image                  linux40.gif
    statusmap_image             linux40.gd2
    vrml_image                  linux40.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}

define hostextinfo{

    host_name                   serveur-linux-02
    notes                       (2) Serveur Linux
    #notes_url                  https://10.111.111.222:8443
    #action_url                 https://10.111.111.222:8444
    icon_image_alt              (2) Serveur Linux
    icon_image                  linux40.gif
    statusmap_image             linux40.gd2
    vrml_image                  linux40.gif
    #2d_coords                  400,600
    #3d_coords                  100.0,50.0,75.0
}
```



