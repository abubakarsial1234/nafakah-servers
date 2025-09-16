data "alicloud_vswitches" "vswitch" {
  vpc_id     = var.vpc_id
  zone_id    = var.availability_zone
  cidr_block = var.vswitch_cidr
}