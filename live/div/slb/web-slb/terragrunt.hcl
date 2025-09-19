include "env" {
  path = find_in_parent_folders("env.hcl")
}

terraform {
  source = "../../../../modules/slb"
}

dependency "vswitch_b" {
  config_path = "../../vswitch/vswitch-2"
}

dependency "ecs_web_server" {
  config_path = "../../ecs/NAFAKAH-SSRS"
}

inputs = {
  slb_name = "nafakah-slb-div"
  vswitch_id = dependency.vswitch_b.outputs.vswitch_id
  backend_server_ids = [dependency.ecs_web_server.outputs.instance_id]


  listeners = [
    {
      protocol      = "http"
      frontend_port = 80
      backend_port  = 80
    },
    {
      protocol      = "tcp" 
      frontend_port = 443
      backend_port  = 443
    }
  ]

  tags = {
    Environment = "dev"
    Purpose     = "WebApp-LoadBalancer"
  }
}