# # .../live/div/redis/app-cache/terragrunt.hcl

# terraform {
#   source = "../../../../modules/redis"
# }

# # [FIX] These dependency blocks must be present
# dependency "vswitch_a" {
#   config_path = "../../vswitch/vswitch-1"
# }
# dependency "vswitch_b" {
#   config_path = "../../vswitch/vswitch-2"
# }
# dependency "ecs_server" {
#   config_path = "../../ecs/NAFAKAH-SSRS"
# }


# inputs = {
#   instance_name = "ntdp-redis-uat"
  
#   primary_zone_id   = "me-central-1a"
#   secondary_zone_id = "me-central-1b"
  
#   # Use the correct instance_class for your region, found via Alibaba Cloud CLI
#   instance_class = "tair.cluster.standard.1g"

#   # The lines below use the dependency blocks defined above
#   vswitch_id   = dependency.vswitch_b.outputs.vswitch_id
#   security_ips = [dependency.ecs_server.outputs.private_ip]
  
#   redis_password = "Your-Strong-P@ssword-Here!"
# }