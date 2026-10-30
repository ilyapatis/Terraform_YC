locals {
  web = "${ var.name }-${ var.env }-${ var.project }-${ var.role[0] }"
  db = "${ var.name }-${ var.env }-${ var.project }-${ var.role[1] }"
  vms_metadata = {
    "serial-port-enable" = "1"
    "ssh-keys"           = "ubuntu:${var.vms_ssh_public_root_key}"
  }
}