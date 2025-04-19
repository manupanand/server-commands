
---

```markdown
# 🖥️ KVM Virtual Machine Setup on RHEL with Ubuntu Server

This guide automates the setup of a KVM-based virtualization environment on RHEL using QEMU, libvirt, and virt-install, followed by the creation of a virtual machine running Ubuntu Server.

---

## 📋 Prerequisites

Ensure your CPU supports virtualization:

```bash
egrep -c '(vmx|svm)' /proc/cpuinfo   # Output should be > 0
lscpu | grep Virtualization
```

---

## 📦 Install Required Packages

```bash
sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils virt-manager
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $(whoami)
newgrp libvirt
```

---

## ✅ Verify Setup

Check that KVM modules are loaded and libvirt is working:

```bash
lsmod | grep kvm
virsh list --all
```

---

## 💽 Create Virtual Disk

Create a QCOW2 virtual disk image for the VM:

```bash
qemu-img create -f qcow2 ~/ubuntu-server.qcow2 15G
```

---

## 🚀 Install Ubuntu VM

Use `virt-install` to launch the Ubuntu Server installation:

```bash
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
```

> 💡 You must have the Ubuntu Server ISO downloaded to `~/Downloads`.

---

## 🌐 Network Configuration (Static IP)

After Ubuntu installation, configure the network manually:

Edit the Netplan config:
```bash
sudo vim /etc/netplan/00-installer-config.yaml
```

Set the following static IP config:
```yaml
network:
  version: 2
  ethernets:
    enp1s0:
      dhcp4: no
      addresses: [192.168.122.101/24]
      gateway4: 192.168.122.1
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
```

Apply the network changes:

```bash
sudo netplan apply
```

---

## ✅ Final Checks

- Confirm VM IP:
  ```bash
  ip a
  ```

- Test connectivity:
  ```bash
  ping google.com
  ```

---

## 📎 Notes

- The default `libvirt` network assigns IPs in the `192.168.122.0/24` range.
- Adjust RAM, CPU, or disk size as needed in the `virt-install` command.
- You can use `virt-manager` GUI for easier VM management.

---

---

## 🛠️ Steps to Add an Additional Virtual Hard Disk to a Running RHEL VM

### ✅ 1. **Create the Virtual Disk (e.g., 10G)**
```bash
qemu-img create -f qcow2 /var/lib/libvirt/images/extra-disk.qcow2 10G
```

---

### ✅ 2. **Attach the Disk to the Running VM**

If using **libvirt** (via `virsh`):

```bash
virsh attach-disk <vm-name> /var/lib/libvirt/images/extra-disk.qcow2 vdb --targetbus virtio --persistent
```

- `vdb` → this will be `/dev/vdb` inside the VM (second virtio disk)
- `--persistent` → ensures it's attached on reboot
- `--targetbus virtio` → makes the disk faster (recommended)

---

### ✅ 3. **Verify Inside the RHEL VM**

SSH into the VM or access it via console:

```bash
lsblk
```

You should see `/dev/vdb` or similar.

---

### ✅ 4. **Partition, Format & Mount the Disk**

#### (a) Partition:
```bash
sudo fdisk /dev/vdb
```
- Press `n` to create a new partition.
- Save with `w`.

#### (b) Format:
```bash
sudo mkfs.xfs /dev/vdb1
```
Or use `ext4` if you prefer:
```bash
sudo mkfs.ext4 /dev/vdb1
```

#### (c) Create mount point:
```bash
sudo mkdir /mnt/data
```

#### (d) Mount:
```bash
sudo mount /dev/vdb1 /mnt/data
```

#### (e) Make it permanent (add to `/etc/fstab`):
```bash
echo '/dev/vdb1 /mnt/data xfs defaults 0 0' | sudo tee -a /etc/fstab
```

> Use `blkid` if you prefer to mount by UUID (recommended in production).

---

### ✅ 5. **Verify the Mount**
```bash
df -h
```

---