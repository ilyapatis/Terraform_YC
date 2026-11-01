###cloud vars

variable "vms_ssh_public_root_key" {
  type        = string
  sensitive   = true
  description = "Публичный SSH‑ключ (содержимое .pub файла) для всех ВМ"
}

variable "cloud_id" {
  type        = string
  default     = "b1gdg8jnk3itjgqs10v2"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gj6oetvra83p5q8j1g"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "zone_e" {
  type        = string
  default     = "ru-central1-e"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "cidr_a" {
  type        = list(string)
  default     = ["192.168.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "cidr_e" {
  type        = list(string)
  default     = ["192.168.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###ssh vars

#variable "vms_ssh_root_key" {
# type        = string
# default     = "<your_ssh_id_rsa_key>"
# description = "ssh-keygen -t rsa -b 4096"
#}

variable "name" {
  type        = string
  default     = "netology"
}

variable "env" {
  type        = string
  default     = "develop"
}

variable "project" {
  type        = string
  default     = "platform"
}

variable "role" {
  type    = list(string)
  default = ["web", "db"]
}