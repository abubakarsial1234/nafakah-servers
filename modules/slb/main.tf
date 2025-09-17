
locals {
  listener_map = { for l in var.listeners : "${l.protocol}-${l.frontend_port}" => l }
}


resource "alicloud_slb" "slb" {
  load_balancer_name = var.slb_name
  vswitch_id         = var.vswitch_id
  load_balancer_spec = var.instance_spec
  payment_type       = "PayAsYouGo"
  tags               = var.tags
}


resource "alicloud_slb_server_group" "server_group" {
  for_each         = local.listener_map
  load_balancer_id = alicloud_slb.slb.id
  name             = "${var.slb_name}-group-${each.key}"
}


resource "alicloud_slb_server_group_server_attachment" "attachment" {
  for_each        = local.listener_map
  server_group_id = alicloud_slb_server_group.server_group[each.key].id
  server_id       = var.backend_server_ids[0]
  port            = each.value.backend_port
  weight          = 100
}


resource "alicloud_slb_listener" "listener" {
  for_each              = local.listener_map
  load_balancer_id      = alicloud_slb.slb.id
  server_group_id       = alicloud_slb_server_group.server_group[each.key].id
  protocol              = each.value.protocol
  frontend_port         = each.value.frontend_port
  bandwidth             = -1
  health_check_type     = each.value.protocol == "http" ? "http" : "tcp"
  health_check_uri      = each.value.protocol == "http" ? "/" : null
}