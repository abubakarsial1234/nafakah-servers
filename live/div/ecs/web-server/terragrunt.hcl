terraform {
  source = "../../../../modules/ecs"
}

dependency "vswitch" {
  config_path = "../../vswitch/vswitch-1" // Batayein ke instance kis VSwitch mein banana hai
}
dependency "vpc" {
  config_path = "../../vpc"
}

inputs = {
  # --- Instance ki Details ---
  instance_type   = "ecs.g6.large"
  image_id        = "win2022_21H2_x64_dtc_en-us_40G_alibase_20250817.vhd" // !! Apni pasand ki Image ID daalein
  instance_name   = "my-web-server"
  vswitch_id      = dependency.vswitch.outputs.vswitch_id
  
  # --- Security Group ki Details (jo yahin banega) ---
  create_sg       = true
  vpc_id          = dependency.vpc.outputs.vpc_id
  sg_name         = "web-server-sg"
  sg_rules = [
    { port = "80/80", protocol = "tcp", cidr_ip  = "0.0.0.0/0" },
    { port = "22/22", protocol = "tcp", cidr_ip  = "0.0.0.0/0" } // Isay apni IP se badal lein
  ]
}