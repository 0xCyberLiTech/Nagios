<!-- MASTER-HEADER-START -->
<div align="center">

<a href="https://0xcyberlitech.com/">
  <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/headers/header-nagios.svg" alt="0xCyberLiTech // Nagios" width="100%" />
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


# <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-shield.svg" width="20" height="20" align="absmiddle" alt="" /> Script d'installation automatisée de Nagios Core 4.5.x & Plugins 2.4.x (Debian 12, 13 Trixie & 14 Forky)

## <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-plan.svg" width="18" height="18" align="absmiddle" alt="" /> 01 // PRÉSENTATION & COMPATIBILITÉ MULTI-DEBIAN
<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-section-cyan.svg" width="100%" alt="" />

Ce script Bash réalise le déploiement complet, interactif et déterministe de **Nagios Core `4.5.x`** et de **Nagios Plugins `2.4.x`** compilés depuis les sources officielles GitHub :
- **Systèmes supportés :** **Debian 12 (`Bookworm`)**, **Debian 13 (`Trixie` — Stable)** et **Debian 14 (`Forky` — Next-Gen)**.
- **Compilation persistante :** utilise `/usr/local/src/nagios` (évite le piège du `/tmp` en RAM `tmpfs` de Debian 13/14).
- **Support PHP 8.2 / 8.4+ & OpenSSL 3.x :** utilise les métapaquets Debian natifs et configure Apache2 + `systemd` automatiquement.
- **Sécurité :** génère un mot de passe aléatoire fort (`openssl rand -base64 12`) pour le compte `nagiosadmin`.

---

## <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-plan.svg" width="18" height="18" align="absmiddle" alt="" /> 02 // CRÉATION DU SCRIPT D'INSTALLATION AUTOMATISÉE
<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-section-cyan.svg" width="100%" alt="" />

### <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-target.svg" width="18" height="18" align="absmiddle" alt="" /> A. Créer le script `/usr/local/sbin/install-nagios.sh`

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> sudo nano /usr/local/sbin/install-nagios.sh
> ```
<!-- CODE-WINDOW-END -->

### <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-target.svg" width="18" height="18" align="absmiddle" alt="" /> B. Code complet du script (`Debian 12 / 13 Trixie / 14 Forky`)

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> #!/bin/bash
> set -euo pipefail
>
> # Vérification des privilèges root
> if [[ "$EUID" -ne 0 ]]; then
>   echo "[NON] Ce script doit être exécuté en tant que root (sudo)."
>   exit 1
> fi
>
> clear
> echo "############################################################"
> echo "#   Script d'installation Nagios Core 4.5.x & Plugins 2.4  #"
> echo "#   Compatible Debian 12 (Bookworm), 13 (Trixie) & 14      #"
> echo "############################################################"
> echo
>
> read -r -p "Souhaitez-vous lancer l'installation complète ? [o/N] " confirm
> if [[ ! "$confirm" =~ ^[oO]$ ]]; then
>   echo "Installation annulée."
>   exit 1
> fi
>
> WORKDIR="/usr/local/src/nagios"
> HTPASSWD_USER="nagiosadmin"
>
> echo "[1/10] Mise à jour du système Debian"
> apt update && apt full-upgrade -y
>
> echo "[2/10] Création du répertoire de compilation persistant (${WORKDIR})"
> mkdir -p "$WORKDIR"
> cd "$WORKDIR"
>
> echo "[3/10] Installation des dépendances de compilation, Apache2 & PHP (8.2/8.4+)"
> apt install -y \
>   autoconf \
>   build-essential \
>   gcc \
>   libc6 \
>   make \
>   wget \
>   unzip \
>   apache2 \
>   apache2-utils \
>   libapache2-mod-php \
>   php \
>   php-gd \
>   libgd-dev \
>   openssl \
>   libssl-dev \
>   curl \
>   bc \
>   gawk \
>   dc \
>   snmp \
>   libnet-snmp-perl \
>   gettext \
>   fping \
>   dnsutils
>
> echo "[4/10] Téléchargement de la dernière version stable de Nagios Core"
> NAGIOS_VER=$(curl -fsSL https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest | grep tag_name | cut -d '"' -f 4)
> wget "https://github.com/NagiosEnterprises/nagioscore/releases/download/${NAGIOS_VER}/${NAGIOS_VER}.tar.gz"
> tar -xzf "${NAGIOS_VER}.tar.gz"
> cd "${NAGIOS_VER}"
>
> echo "[5/10] Compilation et installation de Nagios Core (${NAGIOS_VER})"
> ./configure --with-httpd-conf=/etc/apache2/sites-enabled
> make all
> make install-groups-users
> usermod -a -G nagios www-data
> make install
> make install-daemoninit
> make install-commandmode
> make install-config
> make install-webconf
>
> echo "[6/10] Activation des modules Apache2 (rewrite & cgi)"
> a2enmod rewrite cgi
>
> echo "[7/10] Création du compte ${HTPASSWD_USER} avec mot de passe fort"
> NAGIOS_PASS=$(openssl rand -base64 12)
> htpasswd -cb /usr/local/nagios/etc/htpasswd.users "$HTPASSWD_USER" "$NAGIOS_PASS"
>
> echo "[8/10] Configuration Apache2 : redirection racine vers /nagios"
> echo 'RedirectMatch ^/$ /nagios' > /etc/apache2/conf-available/nagios-redirect.conf
> a2enconf nagios-redirect
>
> echo "[9/10] Téléchargement et compilation des Nagios Plugins"
> cd "$WORKDIR"
> PLUGIN_VER=$(curl -fsSL https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/release-//')
> wget "https://github.com/nagios-plugins/nagios-plugins/releases/download/release-${PLUGIN_VER}/nagios-plugins-${PLUGIN_VER}.tar.gz"
> tar -xzf "nagios-plugins-${PLUGIN_VER}.tar.gz"
> cd "nagios-plugins-${PLUGIN_VER}"
> ./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl
> make
> make install
>
> echo "[10/10] Validation pre-flight et démarrage des services systemd"
> /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
> systemctl daemon-reload
> systemctl enable --now apache2 nagios
> systemctl restart apache2 nagios
>
> IP_SRV=$(hostname -I | awk '{print $1}')
> echo
> echo "[OK] Nagios Core (${NAGIOS_VER}) & Plugins (${PLUGIN_VER}) installés avec succès !"
> echo "Interface Web : http://${IP_SRV}/nagios"
> echo "Identifiant   : ${HTPASSWD_USER}"
> echo "Mot de passe  : ${NAGIOS_PASS}"
> ```
<!-- CODE-WINDOW-END -->

---

## <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-plan.svg" width="18" height="18" align="absmiddle" alt="" /> 03 // EXÉCUTION & VÉRIFICATION
<img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-section-cyan.svg" width="100%" alt="" />

### <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-target.svg" width="18" height="18" align="absmiddle" alt="" /> A. Rendre le script exécutable et le lancer

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> sudo chmod +x /usr/local/sbin/install-nagios.sh
> sudo /usr/local/sbin/install-nagios.sh
> ```
<!-- CODE-WINDOW-END -->

### <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-target.svg" width="18" height="18" align="absmiddle" alt="" /> B. Exemple de sortie finale

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> [OK] Nagios Core (nagios-4.5.9) & Plugins (2.4.12) installés avec succès !
> Interface Web : http://192.168.1.100/nagios
> Identifiant   : nagiosadmin
> Mot de passe  : Gs8JkLzQ29Pz
> ```
<!-- CODE-WINDOW-END -->

### <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/icons/wire-target.svg" width="18" height="18" align="absmiddle" alt="" /> C. Commandes de diagnostic sous Debian 12, 13 (`Trixie`) & 14 (`Forky`)

<!-- CODE-WINDOW-START -->
> [!CAUTION]
> <img src="https://raw.githubusercontent.com/0xCyberLiTech/0xcyberlitech/main/assets/glow-code-red.svg" width="100%" alt="TERMINAL // BLOC DE CODE" />
>
> ```bash
> sudo systemctl status nagios apache2 --no-pager
> sudo journalctl -u nagios -n 50 --no-hostname
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
