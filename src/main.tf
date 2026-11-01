resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_web" {
  name           = "${var.vpc_name}-web"
  zone           = var.zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks =  var.cidr_a
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = "${var.vpc_name}-db"
  zone           = var.zone_e
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.cidr_e
}

data "yandex_compute_image" "ubuntu_web" {
  family = var.vm_web_image_family
}

data "yandex_compute_image" "ubuntu_db" {
  family = var.vm_db_image_family
}

# Web VM
resource "yandex_compute_instance" "platform_web" {
  name = local.vm_names["web"]
  platform_id = var.vm_web_platform_id
  zone           = var.zone_a

  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_web.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_web.id
    nat       = var.vm_nat_enabled
  }

  metadata = {
    "serial-port-enable" = var.vms_metadata["web"].serial_port_enable
    "ssh-keys"           = "ubuntu:${var.vms_ssh_public_root_key}"
  }
}

# DB VM
resource "yandex_compute_instance" "platform_db" {
  name = local.vm_names["db"]
  platform_id = var.vm_db_platform_id
  zone           = var.zone_e

  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_db.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_nat_enabled
  }

  metadata = {
    "serial-port-enable" = var.vms_metadata["db"].serial_port_enable
    "ssh-keys"           = "ubuntu:${var.vms_ssh_public_root_key}"
  }
}