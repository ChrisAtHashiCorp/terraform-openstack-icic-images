# Terraform ICIC (IBM Cloud Infrastructure Center) Base Images Module

Quickly and reproducably deploy official base cloud images onto ICIC for
several Linux distros.

Currently this module supports deploying the following operating systems (and the default versions to install):
- Alma Linux
  - 10.1
  - 9.7
- Rocky Linux
  - 10.1
  - 9.7
- Ubuntu
  - 25.10 (Questing)
  - 24.04 LTS (Noble)

## Requirements
- Terraform >= 1.13.1
- OpenStack Provider >= 3.3.2
