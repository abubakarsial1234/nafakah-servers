# --- Naya Security Group aur uske Rules (agar user chahe) ---
resource "alicloud_security_group" "sg" {
  # Yeh resource sirf tab banega jab 'create_sg' variable true ho
  count  = var.create_sg ? 1 : 0
  
  name   = var.sg_name
  vpc_id = var.vpc_id
}

resource "alicloud_security_group_rule" "ingress" {
  # Yeh rules sirf tab baneinge jab naya SG ban raha ho
  for_each = var.create_sg ? { for rule in var.sg_rules : rule.port => rule } : {}

  type              = "ingress"
  ip_protocol       = each.value.protocol
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = each.value.port
  priority          = 1
  security_group_id = alicloud_security_group.sg[0].id
  cidr_ip           = each.value.cidr_ip
}


# --- ECS Instance Resource ---
resource "alicloud_instance" "instance" {
  instance_type   = var.instance_type
  image_id        = var.image_id
  instance_name   = var.instance_name
  vswitch_id      = var.vswitch_id
  
  # Shart (condition): Agar naya SG ban raha hai to uski ID istemal karo, warna jo IDs di gayi hain woh istemal karo
  security_groups = var.create_sg ? [alicloud_security_group.sg[0].id] : var.security_group_ids

  system_disk_category = "cloud_essd"
  system_disk_size     = 50

  tags = {
    CreatedBy = "Terragrunt"
  }
}