output "vpc_id" {
  value = data.alicloud_vpcs.vpc.vpcs[0].id
}