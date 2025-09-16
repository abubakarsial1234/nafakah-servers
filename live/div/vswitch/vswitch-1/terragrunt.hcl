terraform {
  source = "../../../../modules/vswitch"
}
dependency "vpc" {
  config_path = "../../vpc"
}
inputs = {
  vpc_id              = dependency.vpc.outputs.vpc_id
  availability_zone   = "me-central-1a" // !! Yahan apne pehle VSwitch ka sahi Zone daalein
  vswitch_cidr        = "172.27.112.0/20"  // !! Yahan apne pehle VSwitch ka sahi CIDR daalein
}