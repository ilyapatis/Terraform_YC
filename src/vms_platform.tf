### vm_web vars (первая ВМ)
#variable "vm_web_name" {
# type        = string
# default     = "netology-develop-platform-web"
# description = "Name of the web VM instance"
#}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for the web VM"
}

#variable "vm_web_cores" {
# type        = number
# default     = 2
# description = "CPU cores for the web VM"
#}

#variable "vm_web_memory" {
# type        = number
# default     = 2
# description = "Memory in GB for the web VM"
#}

#variable "vm_web_core_fraction" {
# type        = number
# default     = 20
# description = "Core fraction (in percent) for the web VM"
#}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2404-lts"
  description = "Image family for the web VM boot disk"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Enable preemptible mode for the web VM"
}

### vm_db vars (вторая ВМ)
#variable "vm_db_name" {
# type        = string
# default     = "netology-develop-platform-db"
# description = "Name of the DB VM instance"
#}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for the DB VM"
}

#variable "vm_db_cores" {
# type        = number
# default     = 2
# description = "CPU cores for the DB VM"
#}

#variable "vm_db_memory" {
# type        = number
# default     = 2
# description = "Memory in GB for the DB VM"
#}

#variable "vm_db_core_fraction" {
# type        = number
# default     = 20
# description = "Core fraction (in percent) for the DB VM"
#}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2404-lts"
  description = "Image family for the DB VM boot disk"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = false
  description = "Enable preemptible mode for the DB VM (usually false for DB)"
}

variable "vm_nat_enabled" {
  type        = bool
  default     = true
  description = "Включить NAT для сетевых интерфейсов ВМ"
}

variable "vms_resources" {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "vms_metadata" {
  type = map(object({
    serial_port_enable = string
    ssh_keys           = string
  }))
  description = "Metadata для ВМ: serial-port-enable и ssh-keys"
  default = {
    "web" = {
      serial_port_enable = "1"
      # Ключ подставляем уже при использовании переменной, не в default
      ssh_keys           = ""
    }
    "db" = {
      serial_port_enable = "1"
      ssh_keys           = ""
    }
  }
}