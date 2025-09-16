
variable "instance_type" {
  type        = string
}

variable "image_id" {
  type        = string
}

variable "instance_name" {
  type        = string
}

variable "vswitch_id" {
  type        = string
}

variable "vpc_id" {
  type        = string
}


variable "create_sg" {
  type        = bool
  default     = false
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
}

variable "sg_name" {
  type        = string
  default     = ""
}

variable "sg_rules" {
  type = list(object({
    port      = string
    protocol  = string
    cidr_ip   = string
  }))
  default = []
}