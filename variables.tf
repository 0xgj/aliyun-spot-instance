variable "count" {
  default = "1"
}
variable "count_format" {
  default = "%02d"
}

variable "image_id" {
  default = "ubuntu_16_0402_64_20G_alibase_20171227.vhd"
}

variable "role" {
  default = "work"
}

variable "region" {
  default = "cn-beijing"
}

variable "short_name" {
  default = "hi"
}

variable "ecs_type" {
  default = "ecs.n4.small"
}

variable "ecs_password" {
  default = "Test12345"
}

variable "allocate_public_ip" {
  default = true
}

variable "internet_charge_type" {
  default = "PayByTraffic"
}

variable "internet_max_bandwidth_out" {
  default = 5
}

variable "disk_category" {
  default = "cloud_efficiency"
}
variable "disk_size" {
  default = "40"
}

variable "nic_type" {
  default = "internet"
}
