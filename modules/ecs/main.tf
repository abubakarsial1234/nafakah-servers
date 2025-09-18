
resource "alicloud_security_group" "sg" {
  count  = var.create_sg ? 1 : 0
  name   = var.sg_name
  vpc_id = var.vpc_id
}

resource "alicloud_security_group_rule" "ingress" {
  for_each = { for rule in var.sg_rules : rule.port => rule }

  type                   = "ingress"
  ip_protocol            = each.value.protocol
  port_range             = each.value.port
  
  priority               = 1
  security_group_id      = alicloud_security_group.sg[0].id
  
  cidr_ip                  = lookup(each.value, "cidr_ip", null)
  source_security_group_id = lookup(each.value, "source_sg_id", null)

}


resource "alicloud_instance" "instance" {
  instance_type   = var.instance_type
  image_id        = var.image_id
  instance_name   = var.instance_name
  vswitch_id      = var.vswitch_id
  password        = var.instance_password
  security_groups = var.create_sg ? [alicloud_security_group.sg[0].id] : var.security_group_ids

  system_disk_category = "cloud_essd"
  system_disk_size     = 100

  tags = {
    CreatedBy = "Terragrunt"
  }
}

resource "alicloud_eip" "eip" {
  count = var.assign_public_ip ? 1 : 0
  name  = "${var.instance_name}-eip"
  bandwidth = 12
}

resource "alicloud_eip_association" "eip_assoc" {
  count         = var.assign_public_ip ? 1 : 0
  allocation_id = alicloud_eip.eip[0].id
  instance_id   = alicloud_instance.instance.id
}