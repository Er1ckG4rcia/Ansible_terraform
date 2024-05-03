variable "vsphere_server" {
  description = "vCenter server for vSphere integration"
  type        = string
}

variable "vsphere_user" {
  description = "User for vSphere integration"
  type        = string
}

variable "vsphere_password" {
  description = "Password for vSphere integration"
  type        = string
  sensitive   = true
}

variable "vm_name" {
  description = "The name of the VM to be created"
  type        = string
}

variable "vm_name_suffix" {
  description = "Suffix to append to the VM name"
  type        = string
  default     = ""
}

variable "vcpu" {
  description = "Number of virtual CPUs"
  type        = number
}

variable "ram" {
  description = "Amount of RAM in MB"
  type        = number
}

variable "storage" {
  description = "Disk size in GB"
  type        = number
}
