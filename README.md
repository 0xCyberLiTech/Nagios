![Nagios](./images/nagios.png)

# Installation de Nagios-core & Nagios-plugins sur DEBIAN 11 & 12.
Celle-ci est effectuée depuis les sources.

## Les étapes suivantes sont à réaliser :

| Cat | Etapes |
|------|------| 
| - A. | [Préparation avant l'installation de Nagios.](#préparation-avant-installation-de-nagios) |
| - B. | [Téléchargement des sources de Nagios-core dans sa dernère version stable.](#téléchargement-de-nagios-core) |
| - C. | [Compilation depuis les sources de Nagios-core.](#compilation-de-Nagios-core) |
| - D. | [Téléchargement des sources de Nagios-plugins dans sa dernère version stable.](#téléchargement-de-nagios-plugins) |
| - E. | [Compilation depuis les sources de Nagios-plugins.](#compilation-de-Nagios-plugins) |
| - F. | [Tester à nouveau Nagios.](#test-de-Nagios) |
| - G. | [Installation automatisée de Nagios-core & Nagios-plugins.](#installation-automatisée-Nagios-core) |
| - H. | [Installation du plugin NRPE 4.1.0 depuis le serveur qui héberge Nagios Core.](Installation_NRPE_4.1.0-server.md) |
| - I. | [Installation du plugin NRPE 4.1.0 + Nagios-plugins depuis la machine distante Linux à monitorer.](Installation_NRPE_4.1.0-client.md) |
| - J. | [Installer et configurer (NTPsec).](https://github.com/0xCyberLiTech/Smokeping/blob/main/install-ntpsec.md) |





