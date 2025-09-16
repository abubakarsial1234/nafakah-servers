terraform {
  source = "../../../../modules/rds"
}

dependency "vpc" {
  config_path = "../../vpc"
}
dependency "vswitch" {
  config_path = "../../vswitch/vswitch-1"
}
dependency "ecs_server" {
  config_path = "../../ecs/web-server"
}

inputs = {
  engine           = "SQLServer"

  engine_version   = "2019_cluster_se"

  instance_type    = "rds.mssql.s1.small"
  
  instance_storage = 20
  instance_name    = "my-app-mssql-db" 
  vswitch_id       = dependency.vswitch.outputs.vswitch_id
  
  create_sg        = true
  vpc_id           = dependency.vpc.outputs.vpc_id
  sg_name          = "rds-mssql-sg" 
  sg_rules = [
    {
      port         = "1433/1433"
      protocol     = "tcp"
      source_sg_id = dependency.ecs_server.outputs.new_sg_id
    }
  ]
}