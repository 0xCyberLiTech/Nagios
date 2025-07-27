# 📦 CHANGELOG.md

Ce fichier documente les modifications apportées au projet Nagios par 0xCyberLiTech.

## [1.0.0] - 2025-07-27
### 🚀 Première version stable
- Ajout du script `nagios.sh` pour automatiser l'installation de Nagios sur Debian/Ubuntu.
- Installation des dépendances : Apache2, PHP, Nagios Core, Nagios Plugins, NRPE.
- Configuration automatique des utilisateurs et des services Nagios.
- Activation du service Apache2 et démarrage de Nagios.
- Création d’un utilisateur `nagiosadmin` avec mot de passe sécurisé.
- Ajout de la documentation dans le README pour faciliter l’utilisation du script.

---

## 📌 À venir
- Support pour d'autres distributions Linux (RedHat, CentOS).
- Interface de configuration interactive.
- Ajout de tests automatisés pour valider l’installation.
