# .../modules/redis/variables.tf

variable "instance_name" {
  description = "Name for the Redis instance."
  type        = string
}

variable "instance_class" {
  description = "The memory size and architecture of the instance."
  type        = string
}

variable "engine_version" {
  description = "The version of the Redis engine."
  type        = string
  default     = "5.0"
}



variable "vswitch_id" {
  description = "The VSwitch ID of the primary zone."
  type        = string
}

variable "primary_zone_id" {
  description = "The primary availability zone for the HA setup."
  type        = string
}

variable "secondary_zone_id" {
  description = "The secondary availability zone for the HA setup."
  type        = string
}

variable "redis_password" {
  description = "Password for the Redis instance."
  type        = string
  sensitive   = true
}

variable "security_ips" {
  description = "List of IP addresses allowed to connect to Redis."
  type        = list(string)
  default     = ["127.0.0.1"]
}