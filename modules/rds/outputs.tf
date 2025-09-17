output "rds_connection_string" {
  description = "The connection endpoint for the RDS instance."
  value       = alicloud_db_instance.rds.connection_string
}

output "rds_port" {
  description = "The port for the RDS instance."
  value       = alicloud_db_instance.rds.port
}

output "rds_id" {
  description = "The ID of the RDS instance."
  value       = alicloud_db_instance.rds.id
}

output "new_sg_id" {
  description = "The ID of the newly created security group."
  value       = var.create_sg ? alicloud_security_group.rds_sg[0].id : "Not created"
}