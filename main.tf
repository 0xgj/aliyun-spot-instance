data "alicloud_instance_types" "instance_type" {
  instance_type_family = "ecs.g5"
  cpu_core_count = "2"
  memory_size = "8"
}

#data "alicloud_instance_types" "instance_type" {
#  instance_type_family = "ecs.g5"
#  cpu_core_count = "4"
#  memory_size = "16"
#}

resource "alicloud_security_group" "group" {
  name = "${var.short_name}"
  description = "New security group"
}

resource "alicloud_security_group_rule" "allow_ssh_22" {
  type = "ingress"
  ip_protocol = "tcp"
  policy = "accept"
  port_range = "22/22"
  priority = 1
  security_group_id = "${alicloud_security_group.group.id}"
  cidr_ip = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "allow_https_443" {
  type = "ingress"
  ip_protocol = "tcp"
  policy = "accept"
  port_range = "443/443"
  priority = 1
  security_group_id = "${alicloud_security_group.group.id}"
  cidr_ip = "0.0.0.0/0"
}

#resource "alicloud_disk" "disk" {
#  availability_zone = "${alicloud_instance.instance.0.availability_zone}"
#  category = "${var.disk_category}"
#  size = "${var.disk_size}"
#  count = "${var.count}"
#}

resource "alicloud_instance" "instance" {
  instance_name = "${var.short_name}-${var.role}-${format(var.count_format, count.index+1)}"
  host_name = "${var.short_name}-${var.role}-${format(var.count_format, count.index+1)}"
  image_id = "${var.image_id}"
  instance_type = "${data.alicloud_instance_types.instance_type.instance_types.0.id}"
  count = "${var.count}"
  security_groups = ["${alicloud_security_group.group.*.id}"]

  internet_charge_type = "${var.internet_charge_type}"
  internet_max_bandwidth_out = "${var.internet_max_bandwidth_out}"

  password = "${var.ecs_password}"

  instance_charge_type = "PostPaid"
  system_disk_category = "cloud_efficiency"
  spot_strategy = "SpotWithPriceLimit"
  spot_price_limit = "1.0"

  tags {
    role = "${var.role}"
    dc = "${var.datacenter}"
  }
}