include "env" {
  path = find_in_parent_folders("env.hcl")
}

terraform {
  source = "../../../modules/vpc"
}
inputs = {
  vpc_cidr = "172.16.0.0/12" 
}