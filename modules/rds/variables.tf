variable "engine" { type = string; default = "PostgreSQL" }
variable "engine_version" { type = string }
variable "instance_type" { type = string }
variable "instance_storage" { type = number }
variable "instance_name" { type = string }
variable "vswitch_id" { type = string }

variable "vpc_id" { type = string; default = null }
variable "create_sg" { type = bool; default = false }
variable "existing_sg_ids" { type = list(string); default = [] }
variable "sg_name" { type = string; default = "" }
variable "sg_rules" {
  type = list(object({
    port         = string
    protocol     = string
    source_sg_id = string
  }))
  default = []
}