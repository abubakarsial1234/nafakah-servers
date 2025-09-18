# terraform {
#   source = "../../../../modules/ecs"
# }

# dependency "vswitch" {
#   config_path = "../../vswitch/vswitch-1" 
# }
# dependency "vpc" {
#   config_path = "../../vpc"
# }

# inputs = {
#   instance_type   = "ecs.g6.large"
#   image_id        = "win2022_21H2_x64_dtc_en-us_40G_alibase_20250817.vhd" 
#   instance_name   = "my-second-web-server"
#   assign_public_ip = true
#   vswitch_id      = dependency.vswitch.outputs.vswitch_id
#   create_sg       = true
#   vpc_id          = dependency.vpc.outputs.vpc_id
#   sg_name         = "second-web-server-sg"
#   sg_rules = [
#     { port = "80/80", protocol = "tcp", cidr_ip  = "0.0.0.0/0" },
#     { port = "3389/3389", protocol = "tcp", cidr_ip  = "39.45.98.120" }  
#   ]
# }