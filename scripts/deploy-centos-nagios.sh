#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

export NAGIOS_USER=nagios
export NAGIOS_GROUP=nagios

export NAGIOS_WEB_USER=nagiosadmin
export NAGIOS_WEB_PASS=adminpass

export NAGIOS_HOME=/usr/local/nagios

# ---- make sure NAGIOS_HOME exists
mkdir -p ${NAGIOS_HOME}

# ---- ensure user existence before provision

groupadd ${NAGIOS_GROUP}                                               && \
    useradd --system -d ${NAGIOS_HOME} -g ${NAGIOS_GROUP} ${NAGIOS_USER}

# https://computingforgeeks.com/install-and-configure-nagios-4-on-rhel-centos-8/
echo "============================Setup Pre-requsites============================================================="
# Set SELinux in permissive mode
sestatus #current mode of SELinux
getenforce #current mode of SELinux
sudo sed -i 's/SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
sudo setenforce 0
sestatus #current mode of SELinux
getenforce #current mode of SELinux
echo "============================Install dependencies============================================================="
dnf update -y
dnf install -y @php
dnf install -y @perl @httpd wget unzip glibc automake glibc-common gettext autoconf php php-cli gcc gd gd-devel net-snmp openssl-devel unzip net-snmp postfix net-snmp-utils
dnf groupinstall -y "Development Tools"
systemctl enable --now httpd php-fpm
systemctl status php-fpm
systemctl status httpd 
echo "============================Download Nagios Core============================================================="
cd ~
export VER="4.4.6"
# https://github.com/NagiosEnterprises/nagioscore/releases
curl -SL --insecure https://github.com/NagiosEnterprises/nagioscore/releases/download/nagios-$VER/nagios-$VER.tar.gz | tar -xzf -
cd nagios-$VER

echo "============================Compiling Nagios Core============================================================="
./configure
make all
# create a user and group for Nagios
make install-groups-users
usermod -a -G nagios apache
# verify users
id nagios
id apache
#Install Nagios base
make install
# Install the init script in /lib/systemd/system
make install-daemoninit
# Install and configures permissions on the directory for holding the external command file
make install-commandmode
# Install sample config files in /usr/local/nagios/etc
make install-config
# Install the Apache config file for the Nagios web interface
make install-webconf
# Installs the Exfoliation theme for the Nagios web interface
make install-exfoliation
# Install the classic theme for the Nagios web interface
make install-classicui


# ---- nagios web

htpasswd -bc ${NAGIOS_HOME}/etc/htpasswd.users ${NAGIOS_WEB_USER} ${NAGIOS_WEB_PASS} && \
    chown ${NAGIOS_USER}:${NAGIOS_GROUP} ${NAGIOS_HOME}/etc/htpasswd.users    

systemctl restart httpd
systemctl status httpd

echo "============================Install Nagios Plugins============================================================="
cd ~
VER="2.3.3"
# https://github.com/nagios-plugins/nagios-plugins/releases
curl -SL --insecure https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$VER/nagios-plugins-$VER.tar.gz | tar -xzf -
cd nagios-plugins-$VER
# Compile and install Nagios plugins
./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install
# Verify installation and Start Nagios service
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
# Start and enable nagios service to start at boot
systemctl  enable --now nagios
systemctl status nagios
# Access Nagios Web Dashboard
systemctl enable firewalld
systemctl start firewalld
systemctl status firewalld
firewall-cmd --permanent  --add-service={http,https}
firewall-cmd --reload

# useradd nagios 
# groupadd nagcmd 
# usermod -a -G nagcmd nagios 
# usermod -a -G nagcmd apache
# groups
# id nagios
# id apache

echo "============================Install Nagios Plugins============================================================="

# http://IP/nagios
# nagiosadmin/adminpass