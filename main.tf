# Alma Linux

resource "openstack_images_image_v2" "almalinux" {
  for_each = toset(var.almalinux_versions)

  name = "almalinux-${each.key}"
  image_source_url = templatestring(var.almalinux_defaults.url_tmpl, {
    version       = each.key,
    architecture  = var.architecture,
    version_major = split(".", each.key)[0]
  })
  disk_format      = var.disk_format
  container_format = var.container_format

  properties = {
    hypervisor_type  = var.hypervisor_type
    architecture     = var.architecture
    secure_execution = var.secure_execution
    os_distro        = "Alma-${each.key}"
    powervc_comments = "This base image is managed by Terraform."
  }

  tags = ["Alma", "Alma-${split(".", each.key)[0]}", "Alma-${each.key}"]

  lifecycle {
    ignore_changes = [image_cache_path, image_source_url]
  }
}

# Rocky Linux

resource "openstack_images_image_v2" "rockylinux" {
  for_each = toset(var.rockylinux_versions)

  name = "rockylinux-${each.key}"
  image_source_url = templatestring(var.rockylinux_defaults.url_tmpl, {
    version       = each.key,
    architecture  = var.architecture,
    version_major = split(".", each.key)[0]
  })
  disk_format      = var.disk_format
  container_format = var.container_format

  properties = {
    hypervisor_type  = var.hypervisor_type
    architecture     = var.architecture
    secure_execution = var.secure_execution
    os_distro        = "Rocky-${each.key}"
    powervc_comments = "This base image is managed by Terraform."
  }

  tags = ["Rocky", "Rocky-${split(".", each.key)[0]}", "Rocky-${each.key}"]

  lifecycle {
    ignore_changes = [image_cache_path, image_source_url]
  }
}

# Ubuntu Linux

resource "openstack_images_image_v2" "ubuntu" {
  for_each = toset(var.ubuntu_versions)

  name = "ubuntu-${each.key}"
  image_source_url = templatestring(var.ubuntu_defaults.url_tmpl, {
    version      = each.key,
    architecture = var.architecture,
  })
  disk_format      = var.disk_format
  container_format = var.container_format

  properties = {
    hypervisor_type  = var.hypervisor_type
    architecture     = var.architecture
    secure_execution = var.secure_execution
    os_distro        = "Ubuntu-${each.key}"
    powervc_comments = "This base image is managed by Terraform."
  }

  tags = compact(["Ubuntu", "Ubuntu-${each.key}"])

  lifecycle {
    ignore_changes = [image_cache_path]
  }
}
