#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

# https://app.vagrantup.com/centos/boxes/stream8
vagrant box add "centos/stream8" --provider=libvirt

vagrant init --template Vagrantfile.provision.bash.erb
# must be created in project root directory with Vagrantfile template file
vagrant up --provider=libvirt "vg-centos-05"

vagrant box list #veridy installed boxes
virsh list --all #show all running KVM/libvirt VMs



echo "========================================================================================="
