#!/bin/sh

# --------------------------------------------------------
# 0xCyberLiTech
# Script créé le 09-06-2023
# Script modifié le 21-06-2023
#
# touch install-nagios.sh
# chmod +x install-nagios.sh
# ./install-nagios.sh
# --------------------------------------------------------

# Installation automatisée de Nagios-core sur DEBIAN 11.x & 12.x
# --------------------------------------------------------
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
TEMP_FOLDER='/root/temp/'

mkdir -p $TEMP_FOLDER
cd $TEMP_FOLDER

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

NAGIOS_VER=$(curl -s https://api.github.com/repos/NagiosEnterprises/nagioscore/releases/latest|grep tag_name | cut -d '"' -f 4)
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/$NAGIOS_VER/$NAGIOS_VER.tar.gz

tar -xvzf $NAGIOS_VER.tar.gz

cd $NAGIOS_VER
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
make install-groups-users
usermod -a -G nagios www-data
make install
make install-daemoninit
make install-commandmode
make install-config
make install-webconf
a2enmod rewrite
a2enmod cgi

htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

echo 'RedirectMatch ^/$ /nagios' >> /etc/apache2/apache2.conf

systemctl restart apache2.service
systemctl start nagios.service

cd $TEMP_FOLDER

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

VER=$(curl -s https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/release-//')
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$VER/nagios-plugins-$VER.tar.gz

tar xvf nagios-plugins-$VER.tar.gz

cd nagios-plugins-$VER
./tools/setup
./configure
make
make install

systemctl restart apache2.service
systemctl restart nagios.service
rm -rf $TEMP_FOLDER

# The end...
