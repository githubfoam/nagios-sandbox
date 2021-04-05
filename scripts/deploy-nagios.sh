#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "============================deploy nagios============================================================="

# ---- basic requirements

# ---- references:
# ---- 1. https://support.nagios.com/kb/article.php?id=569#Ubuntu
# ---- 2. https://github.com/nagios-plugins/nagios-plugins/blob/release-2.3.3/REQUIREMENTS
# ---- 3. https://github.com/nagios-plugins/nagios-plugins/blob/release-2.3.3/.travis.yml

apt-get update -qq                                                            && \
apt-get install -yqq --no-install-recommends                                    \
        apache2                                                               \
        apache2-utils                                                         \
        autoconf                                                              \
        bc                                                                    \
        build-essential                                                       \
        curl                                                                  \
        dc                                                                    \
        dnsutils                                                              \
        file                                                                  \
        fping                                                                 \
        gawk                                                                  \
        gcc                                                                   \
        gettext                                                               \
        iputils-ping                                                          \
        ldap-utils                                                            \
        libapache2-mod-php                                                    \
        libc6                                                                 \
        libcrypt-x509-perl                                                    \
        libdatetime-format-dateparse-perl                                     \
        libdbi-dev                                                            \
        libfreeradius-dev                                                     \
        libgd-dev                                                             \
        libkrb5-dev                                                           \
        libldap2-dev                                                          \
        liblwp-protocol-https-perl                                            \
        libmcrypt-dev                                                         \
        libmysqlclient-dev                                                    \
        libnet-snmp-perl                                                      \
        libperl-dev                                                           \
        libpq-dev                                                             \
        libpqxx-dev                                                           \
        libsnmp-dev                                                           \
        libsqlite3-dev                                                        \
        libssl-dev                                                            \
        libtext-glob-perl                                                     \
        libupsclient-dev                                                      \
        make                                                                  \
        netcat                                                                \
        openssh-client                                                        \
        openssl                                                               \
        php-cli                                                               \
        php-gd                                                                \
        smbclient                                                             \
        snmp                                                                  \
        snmp-mibs-downloader                                                  \
        sudo                                                                  \
        supervisor                                                            \
        unzip                                                                 \
        wget




echo "============================deploy nagios finished============================================================="
