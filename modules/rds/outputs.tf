output "rds_connection_string" { value = alicloud_db_instance.rds.connection_string }
output "rds_port" { value = alicloud_db_instance.rds.port }
output "rds_id" { value = alicloud_db_instance.rds.id }
output "new_sg_id" { value = var.create_sg ? alicloud_security_group.rds_sg[0].id : "Not created" }