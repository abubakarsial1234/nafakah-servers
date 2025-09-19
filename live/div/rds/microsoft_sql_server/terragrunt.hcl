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
#   engine                   = "SQLServer"           # SQL Server selected
#   engine_version           = "2022_std"            # 2022 EE (Always On) selected 
#   instance_type            = "rds.mssql.s1.small"  # Instance type from screenshot
#   instance_storage         = 50                    # Storage 50GB
#   instance_name            = "nafakah-dev-db-"     # Instance name
#   db_instance_storage_type = "cloud_essd"          # ESSD selected in screenshot
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
