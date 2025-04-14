#!/bin/bash
# prerequisite check
egrep -c '(vmx|svm)' /proc/cpuinfo #output should be greated than 1
#also 
lscpu |grep Virtualization

sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils virt-manager
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $(whoami)

newgrp libvirt

# check ready or not
lsmod | grep kvm
virsh list --all


# create virtual disk for vm
qemu-img create -f qcow2 ~/ubuntu-server.qcow2 15G

# installation steps
virt-install \
  --name ubuntu-server \
  --ram 2048 \
  --vcpus=2 \
  --cpu host \
  --os-type=linux \
  --os-variant=ubuntu22.04 \
  --disk path=~/ubuntu-server.qcow2,size=15,format=qcow2 \
  --cdrom ~/Downloads/ubuntu-22.04.4-live-server-amd64.iso \
  --network network=default \
  --graphics none \
  --console pty,target_type=serial \
  --boot useserial=on


# after intallation
# ip config
ip a
sudo vim /etc/netplan/00-installer-config.yaml

network:
  version: 2
  ethernets:
    enp1s0:
      dhcp4: no
      addresses: [192.168.122.101/24]
      gateway4: 192.168.122.1
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]

# apply
sudo netplan apply