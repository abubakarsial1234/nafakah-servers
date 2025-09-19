include "env" {
  path = find_in_parent_folders("env.hcl")
}
terraform {
  source = "../../../../modules/vswitch"
}
dependency "vpc" {
  config_path = "../../vpc"
}
inputs = {
  vpc_id              = dependency.vpc.outputs.vpc_id
  availability_zone   = "me-central-1a" 
  vswitch_cidr        = "172.27.112.0/20"  
}