# --- Instance Variables ---
variable "instance_type" {
  description = "The type of the ECS instance (e.g., ecs.g6.large)."
  type        = string
}

variable "image_id" {
  description = "The Image ID to use for the instance."
  type        = string
}

variable "instance_name" {
  description = "The name of the ECS instance."
  type        = string
}

variable "vswitch_id" {
  description = "The VSwitch ID where the instance will be launched."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID, required if creating a new security group."
  type        = string
  default     = null # Yeh sirf tab zaroori hai jab create_sg = true ho
}

# --- Security Group Control Variables ---

variable "create_sg" {
  description = "Agar 'true' set kareinge to is instance ke liye naya SG banega."
  type        = bool
  default     = false
}

variable "security_group_ids" {
  description = "Pehle se banay huay Security Groups ki IDs (agar create_sg = false hai)."
  type        = list(string)
  default     = []
}

variable "sg_name" {
  description = "Naye Security Group ka naam (agar create_sg = true hai)."
  type        = string
  default     = ""
}

variable "sg_rules" {
  description = "Naye Security Group ke liye Ingress rules ki list."
  type = list(object({
    port      = string
    protocol  = string
    cidr_ip   = string
  }))
  default = []
}