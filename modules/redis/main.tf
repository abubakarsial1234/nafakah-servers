# .../modules/redis/main.tf

resource "alicloud_kvstore_instance" "redis" {
  instance_name = var.instance_name
  password      = var.redis_password
  vswitch_id    = var.vswitch_id
  
  # Sirf instance_class istemal hoga
  instance_class = var.instance_class
  engine_version = var.engine_version

  # High Availability (HA)
  zone_id           = var.primary_zone_id
  secondary_zone_id = var.secondary_zone_id

  # Baaki settings
  security_ips         = var.security_ips
  instance_charge_type = "PostPaid"

  tags = {
    CreatedBy = "Terragrunt"
  }
}