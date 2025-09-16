output "instance_id" {
  value = alicloud_instance.instance.id
}

output "public_ip" {
  value       = var.assign_public_ip ? alicloud_eip.eip[0].ip_address : "Not assigned"
}

output "private_ip" {
  value = alicloud_instance.instance.private_ip
}

output "new_sg_id" {
  value       = var.create_sg ? alicloud_security_group.sg[0].id : "Not created"
}