variable "architecture" {
  type = string
  default = "s390x"
}

variable "hypervisor_type" {
  type    = string
  default = "kvm"
}

variable "disk_format" {
  type    = string
  default = "qcow2"
}

variable "container_format" {
  type    = string
  default = "bare"
}

variable "secure_execution" {
  type    = bool
  default = false
}

variable "install_defaults" {
  type = object({
    almalinux  = optional(bool, true)
    rockylinux = optional(bool, true)
    ubuntu     = optional(bool, true)
  })
  default = {}
}

# Alma Linux specifc variables

variable "almalinux_defaults" {
  type = object({
    url_tmpl = optional(string, "https://repo.almalinux.org/almalinux/$${version}/cloud/$${architecture}/images/AlmaLinux-$${version_major}-GenericCloud-latest.$${architecture}.qcow2")
  })
  default = {}
}

variable "almalinux_versions" {
  type    = list(string)
  default = ["9.7", "10.1"]
}

# Rocky Linux specifc variables

variable "rockylinux_defaults" {
  type = object({
    url_tmpl = optional(string, "https://dl.rockylinux.org/pub/rocky/$${version}/images/$${architecture}/Rocky-$${version_major}-GenericCloud-Base.latest.$${architecture}.qcow2")
  })
  default = {}
}

variable "rockylinux_versions" {
  type    = list(string)
  default = ["9.6", "10.1"]
}

# Ubuntu specific variables

variable "ubuntu_defaults" {
  type = object({
    url_tmpl = optional(string, "https://cloud-images.ubuntu.com/releases/$${version}/release/ubuntu-$${version}-server-cloudimg-$${architecture}.img")
  })
  default = {}
}

variable "ubuntu_versions" {
  type    = list(string)
  default = ["22.04", "24.04"]
}
