provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_user
  password             = var.vsphere_password
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "DatacenterIBM"
}

data "vsphere_datastore_cluster" "datastore_cluster" {
  name          = "Cluster_HUSVM"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "HML"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_name}${var.vm_name_suffix}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore_cluster.datastore_cluster.id

  num_cpus = var.vcpu
  memory   = var.ram
  guest_id = "rhel8_64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = var.storage
  }

  cdrom {
    datastore_id = data.vsphere_datastore_cluster.datastore_cluster.id
    path         = "[DS_HUSVM_01] ISO/rhel-9.2-x86_64-boot.iso"
  }
}
