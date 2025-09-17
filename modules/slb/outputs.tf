output "slb_ip_address" {
  description = "The public IP address of the Server Load Balancer."
  value       = alicloud_slb.slb.address
}

output "slb_id" {
  description = "The ID of the Server Load Balancer."
  value       = alicloud_slb.slb.id
}