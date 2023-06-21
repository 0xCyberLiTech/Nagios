## Exemple concernant le fichier /usr/local/nagios/etc/contacts.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 21-06-2023
# CONTACTS.CFG - Exemple de fichier de configuration pour Nagios
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# CONTACTS
# --------------------------------------------------------------------------
# Un seul contact défini par défaut - l'administrateur Nagios (c'est vous)
# Cette définition de contact hérite de nombreuses valeurs par défaut de la
# modèle 'generic-contact' qui est défini ailleurs.

define contact {

    contact_name            nagiosadmin
    use                     generic-contact
    alias                   Nagios Admin
    # email                 marc.malet@lessablesdolonne.fr
}

# --------------------------------------------------------------------------
# CONTACT GROUPS
# --------------------------------------------------------------------------

# Nous n'avons qu'un seul contact dans ce fichier de configuration simple, il y a donc
# pas besoin de créer plus d'un groupe de contacts.

define contactgroup {

    contactgroup_name       admins
    alias                   Nagios Administrators
    members                 nagiosadmin
}
