output "instance_id" {
  value = alicloud_instance.instance.id
}

output "public_ip" {
  value = alicloud_instance.instance.public_ip
}

output "private_ip" {
  value = alicloud_instance.instance.private_ip
}

output "new_sg_id" {
  description = "Naye banaye gaye security group ki ID."
  value       = var.create_sg ? alicloud_security_group.sg[0].id : "Not created"
}