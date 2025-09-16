data "alicloud_vpcs" "vpc" {
  cidr_block = var.vpc_cidr
}