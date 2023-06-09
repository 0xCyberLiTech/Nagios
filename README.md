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
> [!TIP]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-target.svg" width="18" height="18" align="absmiddle" alt="" /> **Guide de Lecture &amp; Progression par Niveau (Nagios)**
> - **Rôle de la brique :** **Nagios Core & NRPE** forment un moteur déterministe d'ordonnancement de sondes (*Plugins*) : chaque contrôle local ou distant retourne un code d'état POSIX normalisé (`0 = OK`, `1 = WARNING`, `2 = CRITICAL`, `3 = UNKNOWN`) déclenchant les escalades d'alertes.
> - **Parcours recommandé :** **Niveau 1 (Fondamentaux &amp; Installation initiale)** pour déployer une base saine &rarr; **Niveau 2 (Configuration &amp; Intégration)** &rarr; **Niveau 3 (Haute Disponibilité, Durcissement &amp; Exploitation)**.

<details>
<summary><img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-puzzle.svg" width="18" height="18" align="absmiddle" alt="" /> <b>Synthèse d'Architecture, Standards Officiels &amp; Diagnostic (Niveau 1 : Fondamentaux · Niveau 2 : Repères · Niveau 3 : Diagnostic)</b></summary>

- **Niveau 1 — Fondamentaux &amp; Principe d'Architecture :** **Nagios Core & NRPE** forment un moteur déterministe d'ordonnancement de sondes (*Plugins*) : chaque contrôle local ou distant retourne un code d'état POSIX normalisé (`0 = OK`, `1 = WARNING`, `2 = CRITICAL`, `3 = UNKNOWN`) déclenchant les escalades d'alertes.
- **Niveau 2 — Repères Officiels (Ports IANA, Fichiers Debian &amp; Commandes de Validation) :** **Ports IANA :** `TCP 5666` (Agent distant NRPE chiffré TLS) · `TCP 80/443` (Interface Web Apache2 CGI) &nbsp;|&nbsp; **Fichiers :** `/usr/local/nagios/etc/nagios.cfg`, `/etc/nagios/nrpe.cfg` &nbsp;|&nbsp; **Validation officielle :** `sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg`.
- **Niveau 3 — Diagnostic d'Incidents &amp; Ingénierie Avancée :** **Diagnostic & Architecture :** Une erreur `CHECK_NRPE: Could not complete SSL handshake` indique généralement que l'IP du serveur Nagios est absente de la directive `allowed_hosts=` dans `/etc/nagios/nrpe.cfg` sur l'hôte supervisé ou que le port `5666/tcp` est filtré.
- **Sources de Vérité Officielles Éditeurs &amp; Standards :** [Documentation Officielle Nagios Core 4](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/) &nbsp;·&nbsp; [Référentiel Officiel Nagios Plugins](https://nagios-plugins.org/)

</details>
<!-- CIEL-PEDAGOGY-END -->


## <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-plan.svg" width="18" height="18" align="absmiddle" alt="" /> 01 // SOMMAIRE DES DOSSIERS TECHNIQUES — ATELIER NAGIOS // SUPERVISION RÉSEAU
<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-section-cyan.svg" width="100%" alt="" />

<div align="center">

| Catégorie  | Sujet                                         | Accès Rapide                                                                                                                                                |
|------------|-----------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Tuto**   | Installation complète de Nagios Core 4.5.9+ & Plugins 2.4.12+ depuis les sources (Debian 12, 13 & 14). | [<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-explore.svg" alt="Ouvrir le dossier" />](NAGIOS-Core-installation-depuis-les-sources.md) |
| **Tuto**   | Mise à jour complète de Nagios Core 4.5.9+ & Plugins 2.4.12+ depuis les sources (Debian 12, 13 & 14).  | [<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-explore.svg" alt="Ouvrir le dossier" />](NAGIOS-Core-mise-a-jour-depuis-les-sources.md)  |
| **Script** | Script d'installation automatisée de Nagios Core 4.5.9+ & Plugins 2.4.12+ (Debian 12, 13 & 14).       | [<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-explore.svg" alt="Ouvrir le dossier" />](NAGIOS-Installation-automatisee-script.md)      |
| **Config** | Exemple : `contacts.cfg`                      | [<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-explore.svg" alt="Ouvrir le dossier" />](NAGIOS-Exemple-contacts.cfg.md)                 |
| **Config** | Exemple : `nagios.cfg`                        | [<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-explore.svg" alt="Ouvrir le dossier" />](NAGIOS-Exemple-nagios.cfg.md)                   |
| **Config** | Exemple : `templates.cfg`                     | [<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-explore.svg" alt="Ouvrir le dossier" />](NAGIOS-Exemple-templates.cfg.md)                |
| **Config** | Exemple : `hostextinfo.cfg`                   | [<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-explore.svg" alt="Ouvrir le dossier" />](NAGIOS-Exemple-hostextinfo.cfg.md)              |
| **Config** | Exemple : `server-linux.cfg`                  | [<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-explore.svg" alt="Ouvrir le dossier" />](NAGIOS-Exemple-server-linux.cfg.md)             |
| **Config** | Exemple : `router.cfg`                        | [<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-explore.svg" alt="Ouvrir le dossier" />](NAGIOS-Exemple-router.cfg.md)                   |
| **Config** | Exemple : `ip-public.cfg`                     | [<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/btn-explore.svg" alt="Ouvrir le dossier" />](NAGIOS-Exemple-ip-public.cfg.md)                |

</div>

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
