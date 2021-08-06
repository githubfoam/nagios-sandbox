# nagios-sandbox
nagios network visibility CTI DFIR

Travis (.com)  branch:
[![Build Status](https://travis-ci.com/githubfoam/nagios-sandbox.svg?branch=master)](https://travis-ci.com/githubfoam/nagios-sandbox)   

[![Ubuntu nagios CI workflow](https://github.com/githubfoam/nagios-sandbox/actions/workflows/ubuntu-workflow.yml/badge.svg?branch=master)](https://github.com/githubfoam/nagios-sandbox/actions/workflows/ubuntu-workflow.yml)



~~~~
>vagrant init --template Vagrantfile.provision.bash.erb
>dir
>vagrant up vg-nagios-01

Browse
http://192.168.50.15/nagios
username/password nagiosadmin/adminpass

>vagrant destroy -f vg-nagios-01

>vagrant global-status

>del Vagrantfile
>dir
~~~~
