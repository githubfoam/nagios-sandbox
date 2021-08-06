# nagios-sandbox
nagios network visibility CTI DFIR

Travis (.com)  branch:
[![Build Status](https://travis-ci.com/githubfoam/nagios-sandbox.svg?branch=dev)](https://travis-ci.com/githubfoam/nagios-sandbox)  

~~~~
>vagrant init --template Vagrantfile.provision.bash.erb
>dir
>vagrant up "vg-nagios-01"


>vagrant destroy -f "vg-nagios-01"

>vagrant global-status

>del Vagrantfile
>dir
~~~~

~~~~
bento/ubuntu-20.04

del Vagrantfile
vagrant init --template Vagrantfile.erb 
vagrant up vg-compute-12

>vagrant port vg-compute-12
The forwarded ports for the machine are listed below. Please note that
these values may differ from values configured in the Vagrantfile if the
provider supports automatic port collision detection and resolution.

    22 (guest) => 2222 (host)
    80 (guest) => 80 (host)
    
vagrant ssh vg-compute-12

automated
servers_list.yml
shell_provision: "provisioning/nagios-docker-alpine311.sh"

manually

vagrant@vg-compute-12:~$ cp -R /vagrant/dockerfiles/ .

vagrant@vg-compute-12:~$ cd dockerfiles/1/

vagrant@vg-compute-12:~/dockerfiles/1$ sudo docker build -t alpine311:nagios446 . --file=Dockerfile.alpine311

vagrant@vg-compute-12:~/dockerfiles/1$ sudo docker image ls
REPOSITORY    TAG         IMAGE ID       CREATED              SIZE
alpine311     nagios446   c6df3cce43d3   About a minute ago   193MB
<none>        <none>      e7e493d68cb3   About a minute ago   612MB
alpine        3.11        e389ae589224   3 months ago         5.62MB
hello-world   latest      d1165f221234   5 months ago         13.3kB

1st instance

vagrant@vg-compute-12:~/dockerfiles/1$ sudo docker run -d   --name nagioswebp80   -v $(pwd)/nagios/etc/:/opt/nagios/etc/   -v $(pwd)/nagios/var:/opt/nagios/var/   -v $(pwd)/nagios/ssmtp:/etc/ssmtp/   -v $(pwd)/nagios/:/opt/Custom-Nagios-Plugins   -p 80:80   -e "TZ=Asia/Paris"   alpine311:nagios446
bf8275aa5d9db70b320ba867f4d71b076edab613e16df8488ed25c577de3ce60

vagrant@vg-compute-12:~/dockerfiles/1$ sudo docker container ls
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS         PORTS                               NAMES
6cf245319277   alpine311:nagios446   "/usr/local/bin/star…"   2 minutes ago   Up 2 minutes   0.0.0.0:80->80/tcp, :::80->80/tcp   nagioswebp80

Browse
http://192.168.20.20:80/nagios/
user/password nagiosadmin/nagios

2nd instance

vagrant@vg-compute-12:~/dockerfiles/1$ sudo docker run -d   --name nagioswebp84   -v $(pwd)/nagios/etc/:/opt/nagios/etc/   -v $(pwd)/nagios/var:/opt/nagios/var/   -v $(pwd)/nagios/ssmtp:/etc/ssmtp/   -v $(pwd)/n
agios/:/opt/Custom-Nagios-Plugins   -p 84:80   -e "TZ=Asia/Paris"   alpine311:nagios446

vagrant@vg-compute-12:~/dockerfiles/1$ sudo docker container ls
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS         PORTS                               NAMES
040f01caad4c   alpine311:nagios446   "/usr/local/bin/star…"   6 seconds ago   Up 6 seconds   0.0.0.0:84->80/tcp, :::84->80/tcp   nagioswebp84
6cf245319277   alpine311:nagios446   "/usr/local/bin/star…"   5 minutes ago   Up 5 minutes   0.0.0.0:80->80/tcp, :::80->80/tcp   nagioswebp80

Browse
http://192.168.20.20:84/nagios/
user/password nagiosadmin/nagios



>vagrant destroy -f vg-compute-12
~~~~

~~~~
bento/centos-stream-8

del Vagrantfile
vagrant init --template Vagrantfile.erb 
vagrant up vg-compute-09
>vagrant port vg-compute-09
The forwarded ports for the machine are listed below. Please note that
these values may differ from values configured in the Vagrantfile if the
provider supports automatic port collision detection and resolution.

    22 (guest) => 2201 (host)
    80 (guest) => 81 (host)

vagrant ssh vg-compute-09


[vagrant@vg-compute-09 ~]$ cp -R /vagrant/dockerfiles/ .
[vagrant@vg-compute-09 ~]$ cd dockerfiles/2/
[vagrant@vg-compute-09 2]$ sudo docker build -t nagios:nagios446 . --file=Dockerfile.ubuntu2004


Step 17/25 : COPY --from=htpasswd /opt/htpasswd.users ${NAGIOS_HOME}/etc/htpasswd.users
invalid from flag value htpasswd: pull access denied for htpasswd, repository does not exist or may require 'docker login': denied: requested access to the resource is denied

~~~~

~~~~
bento/centos-stream-8

del Vagrantfile
vagrant init --template Vagrantfile.erb 
vagrant up vg-compute-13
vagrant ssh vg-compute-13

sudo docker run -it -d --name ubuntu2004 ubuntu:20.04 /bin/bash

[vagrant@vg-compute-13 ~]$ sudo docker container ls
CONTAINER ID   IMAGE          COMMAND       CREATED         STATUS         PORTS     NAMES
4cedf1ef8534   ubuntu:20.04   "/bin/bash"   3 minutes ago   Up 3 minutes             ubuntu2004

typing "Dockerfile.ubuntu2004" manually on docker instance

sudo docker exec -it ubuntu2004 /bin/bash
root@4cedf1ef8534:~# tar --strip 1 -zxf /tmp/nagioscore.tar.gz -C /tmp/nagios

gzip: stdin: unexpected end of file
tar: Child returned status 1
tar: Error is not recoverable: exiting now


vagrant@vg-compute-13 ~]$ sudo docker run -it -d --name ubuntu2004-backup ubuntu:20.04 /bin/bash
453f4a5becb390171786e8876be0f611d97d27b2e0bde7f0719d11a48249ddd6

[vagrant@vg-compute-13 ~]$ sudo docker container ls
CONTAINER ID   IMAGE          COMMAND       CREATED          STATUS          PORTS     NAMES
453f4a5becb3   ubuntu:20.04   "/bin/bash"   5 seconds ago    Up 3 seconds              ubuntu2004-backup
4cedf1ef8534   ubuntu:20.04   "/bin/bash"   25 minutes ago   Up 25 minutes             ubuntu2004

[vagrant@vg-compute-13 ~]$ sudo docker exec -it ubuntu2004-backup /bin/bash
root@453f4a5becb3:/#

~~~~

~~~~

bento/centos-stream-8

del Vagrantfile
vagrant init --template Vagrantfile.erb 
vagrant up vg-compute-13
vagrant ssh vg-compute-13

typing "Dockerfile" manually on docker instance

[vagrant@vg-compute-13 ~]$ sudo docker run -it -d --name ubuntu2004-backup ubuntu:20.04 /bin/bash
66b9500c597dd309fa65fde02837dd751571709adc5e24d196b974f3f1bb7e73
[vagrant@vg-compute-13 ~]$ sudo docker container ls
CONTAINER ID   IMAGE          COMMAND       CREATED          STATUS          PORTS     NAMES
66b9500c597d   ubuntu:20.04   "/bin/bash"   13 seconds ago   Up 12 seconds             ubuntu2004-backup
4cedf1ef8534   ubuntu:20.04   "/bin/bash"   37 minutes ago   Up 37 minutes             ubuntu2004
[vagrant@vg-compute-13 ~]$ sudo docker exec -it ubuntu2004-backup /bin/bash
root@66b9500c597d:/#

root@453f4a5becb3:/# apt-get update -yq && apt-get upgrade -yq

    4  apt-get install -yqq build-essential apache2 php openssl perl make      php-gd libgd-dev libapache2-mod-php libperl-dev      libssl-dev daemon wget apache2-utils unzip
    6  useradd nagios
    7  groupadd nagcmd
    8  usermod -a -G nagcmd nagios
    9  usermod -a -G nagcmd www-data
   10  cd /tmp
   11  wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.5.tar.gz
   13  tar -zxvf /tmp/nagios-4.4.5.tar.gz
   14  cd /tmp/nagios-4.4.5/
   17  ./configure --with-nagios-group=nagios --with-command-group=nagcmd --with-httpd_conf=/etc/apache2/sites-enabled/
   19  make all
   20  history
   21  make install
   22  make install-init
   23  make install-config
   24  make install-commandmode
   25  make install-webconf
   26  cd /tmp/nagios-4.4.5
   27  htpasswd -c /usr/local/nagios/etc/htpasswd.users
   28  a2enmod cgi

root@66b9500c597d:/tmp/nagios-4.4.5# systemctl restart apache2
bash: systemctl: command not found

~~~~

