terraform {
  source = "../../../modules/vpc"
}
inputs = {
  vpc_cidr = "172.16.0.0/12" 
}