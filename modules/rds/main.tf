
resource "alicloud_security_group" "rds_sg" {
  count  = var.create_sg ? 1 : 0
  name   = var.sg_name
  vpc_id = var.vpc_id
}

resource "alicloud_security_group_rule" "rds_ingress" {
  for_each = var.create_sg ? { for rule in var.sg_rules : rule.port => rule } : {}

  type                     = "ingress"
  ip_protocol              = each.value.protocol
  port_range               = each.value.port
  priority                 = 1
  security_group_id        = alicloud_security_group.rds_sg[0].id
  source_security_group_id = each.value.source_sg_id
  nic_type                 = "intranet" 
}


resource "alicloud_db_instance" "rds" {
  engine               = var.engine
  engine_version       = var.engine_version
  category             = var.category
  instance_type        = var.instance_type
  instance_storage     = var.instance_storage
  db_instance_storage_type = var.db_instance_storage_type
  instance_charge_type = "Postpaid"
  instance_name        = var.instance_name
  vswitch_id           = var.vswitch_id
  security_ips         = ["127.0.0.1"]
  security_group_ids   = var.create_sg ? [alicloud_security_group.rds_sg[0].id] : var.existing_sg_ids

  tags = {
    CreatedBy = "Terragrunt"
  }
}