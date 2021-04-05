#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=============================Install kvm qemu libvirt============================================================="
apt-get -qq update
apt-get install -y cpu-checker bridge-utils dnsmasq-base ebtables libvirt-bin libvirt-dev qemu-kvm qemu-utils ruby-dev
systemctl status libvirtd
libvirtd --version
#If 0 it means that your CPU doesn't support hardware virtualization.
# If 1 or more it does - but you still need to make sure that virtualization is enabled in the BIOS.
# egrep -c '(vmx|svm)' /proc/cpuinfo #0
# egrep -c '(vmx|svm)' /proc/cpuinfo | echo "virtualization is  supported" | echo "virtualization is not supported"
addgroup libvirtd
adduser  $(id -un) libvirtd #ensure that your username is added to the group libvirtd
# kvm-ok #INFO: Your CPU does not support KVM extensions
echo "=============================Install kvm qemu libvirt finished============================================================="