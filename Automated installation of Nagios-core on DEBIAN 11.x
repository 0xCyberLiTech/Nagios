#!/bin/sh

# --------------------------------------------------------
# Marc MALET
# Script créé le 09-06-2023 
# Script modifié le 09-06-2023
#
# Automated_installation_of_Nagios-core_on_DEBIAN_11_x.sh
# chmod +x Automated_installation_of_Nagios-core_on_DEBIAN_11_x.sh
#
# --------------------------------------------------------

# Installation automatisée de Nagios-core sur DEBIAN 11.x
# --------------------------------------------------------
# 

# Prérequis avoir installé au paravant sudo
#
# Script created by Marc Malet
# Script created on 28-05-2023
# Csript modified the 28-05-2023
# Script open: GPLv3
#
# Syntaxe: root> chmod a+x auto-install_nagios4.sh
# Syntaxe: root> ./auto-install_nagios4.sh
#
# /usr/local/nagios/bin
# /usr/local/nagios/etc
# /usr/local/nagios/libexec
# /usr/local/nagios/sbin
# /usr/local/nagios/share
# /usr/local/nagios/var

#----------------------------------------------------------//
# GLOBALS VARIABLES COLORS :
#----------------------------------------------------------//
ID=`hostname`

DATE=$(date +%d-%m-%Y-%H-%M)
TEMP_FOLDER="/root/temp/install-nagios.$DATE"

cd /$TEMP_FOLDER
# Prerequisites
# Perform these steps to install the pre-requisite packages.
apt install -y \
       autoconf \
       build-essential \
       gcc \
       libc6 \
       make \
       wget \
       unzip \
       apache2 \
       apache2-utils \
       libapache2-mod-php \
       php \
       php-gd \
       libgd-dev \
       openssl \
       libssl-dev \
       curl

# Downloading the Source nagios core
cd ~
NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest|grep tag_name | cut -d '"' -f 4)
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz

# Extract the tarball
tar -xvzf $NAGIOS_VER.tar.gz

# Compile
cd $NAGIOS_VER
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all

# Create User And Group
# This creates the nagios user and group. The www-data user is also added to the nagios group.
make install-groups-users
usermod -a -G nagios www-data

# Install Binaries
# This step installs the binary files, CGIs, and HTML files.
make install

# Install Service / Daemon
# This installs the service or daemon files and also configures them to start on boot.
make install-daemoninit

# Install Command Mode
# This installs and configures the external command file.
make install-commandmode

# Install Configuration Files
# This installs the *SAMPLE* configuration files. These are required as Nagios needs some configuration files to allow it to start.
make install-config

# Install Apache Config Files
# This installs the Apache web server configuration files and configures the Apache settings.
make install-webconf
a2enmod rewrite
a2enmod cgi

# Prerequisites
# Perform these steps to install the pre-requisite packages.

# Configure Firewall
# You need to allow port 80 inbound traffic on the local firewall so you can reach the Nagios Core web interface.

#iptables -I INPUT -p tcp --destination-port 80 -j ACCEPT
#apt-get install -y iptables-persistent
#Answer yes to saving existing rules

# Create nagiosadmin User Account
# You'll need to create an Apache user account to be able to log into Nagios.

# The following command will create a user account called nagiosadmin and you will be prompted to provide a password for the account.

htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

# Service / Daemon Commands
# Start Apache Web Server

# Redirect root URL (/) to /nagios
echo 'RedirectMatch ^/$ /nagios' >> /etc/apache2/apache2.conf

systemctl restart apache2.service

# Start Service / Daemon
systemctl start nagios.service

# Test Nagios
# Nagios is now running, to confirm this you need to log into the Nagios Web Interface.

# Point your web browser to the ip address or FQDN of your Nagios Core server, for example:

# http://10.25.5.143/nagios
# http://core-013.domain.local/nagios

# You will be prompted for a username and password. The username is nagiosadmin (you created it in a previous step) and the password is what you provided earlier.

# Once you have logged in you are presented with the Nagios interface. Congratulations you have installed Nagios Core.

# Prerequisites
# Perform these steps to install the pre-requisite packages.

cd /root
apt install -y \
       autoconf \
       gcc \
       libc6 \
       libmcrypt-dev \
       make \
       libssl-dev \
       wget \
       bc \
       gawk \
       dc \
       build-essential \
       snmp \
       libnet-snmp-perl \
       gettext

# Downloading The Source
cd ~
VER=$(curl -s https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/release-//')
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$VER/nagios-plugins-$VER.tar.gz
tar xvf nagios-plugins-$VER.tar.gz

# Navigate into the new plugins folder then compile and install.
cd nagios-plugins-$VER
./tools/setup
./configure
make
make install

# Test Plugins
# Point your web browser to the ip address or FQDN of your Nagios Core server, for example:

# http://10.25.5.143/nagios
# http://core-013.domain.local/nagios

# Service / Daemon Commands
# start Apache Web Server
systemctl restart apache2.service

# restart Service / Daemon
systemctl restart nagios.service

# Purge
rm -rf /root/nagios-*

# The end...
