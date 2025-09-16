variable "instance_type" {
  type = string
}

variable "image_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "vswitch_id" {
  type = string
}

variable "vpc_id" {
  type = string
}


variable "create_sg" {
  type    = bool
  default = false
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "instance_password" {
  description = "Password for the Windows instance."
  type        = string
  default     = null
  sensitive   = true
}

variable "sg_name" {
  type    = string
  default = ""
}

variable "sg_rules" {
  description = "A list of ingress rules for the Security Group."
  type = list(object({
    port         = string
    protocol     = string
    cidr_ip      = optional(string) 
    source_sg_id = optional(string) 
  }))
  default = []
}

variable "assign_public_ip" {
  description = "Agar 'true' hai to server ke liye ek naya Public IP (EIP) banayega."
  type        = bool
  default     = false
}