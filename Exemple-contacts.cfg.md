<a name="Exemple-contacts.cfg.md"></a>

## - A. Exemple concernant le fichier /usr/local/nagios/etc/contacts.cfg
```
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 21-06-2023
# Date de modification : le 25-06-2023
# CONTACTS.CFG - Exemple de fichier de configuration pour Nagios.
# /usr/local/nagios/etc/objects/contacts.cfg
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
    # email                 mon@mail.com
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
```
Nous allons tester notre nouvelle configuration que nous avons saisie dans le fichier /usr/local/nagios/etc/objects/contacts.cfg à l'aide de la commande suivante :
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
Si il n'y a pas d'erreur sur cette nouvelle configuration (contacts.cfg), redémarrer Nagios pour la prise en compte de cette nouvelle configuration.
```
systemctl restart nagios.service
```
