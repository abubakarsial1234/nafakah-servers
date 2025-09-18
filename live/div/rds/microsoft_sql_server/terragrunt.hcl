# terraform {
#   source = "../../../../modules/rds"
# }

# dependency "vpc" {
#   config_path = "../../vpc"
# }
# # High Availability ke liye dono VSwitches ki zaroorat hai
# dependency "vswitch" {
#   config_path = "../../vswitch/vswitch-1"
# }

# dependency "ecs_server" {
#   config_path = "../../ecs/NAFAKAH-SSRS"
# }

# inputs = {
#   engine                   = "SQLServer"
#   engine_version           = "2022_ent"
#   instance_type            = "rds.mssql.s2.large"
#   instance_storage         = 50
#   instance_name            = "nafakah-dev-db-"
#   db_instance_storage_type = "cloud_essd"
#   category                 = "Basic"

#   # fix: list instead of string
#   vswitch_id = dependency.vswitch.outputs.vswitch_id,


#   vpc_id    = dependency.vpc.outputs.vpc_id
#   create_sg = true
#   sg_name   = "rds-nafakahsql-sg"

#   sg_rules = [{
#     port         = "1433/1433"
#     protocol     = "tcp"
#     source_sg_id = dependency.ecs_server.outputs.new_sg_id
#   }]
# }
