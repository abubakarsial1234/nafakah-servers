variable "slb_name" {
  description = "Name for the Server Load Balancer."
  type        = string
}

variable "vswitch_id" {
  description = "The VSwitch ID to deploy the SLB into."
  type        = string
}

variable "instance_spec" {
  description = "The specification of the SLB instance."
  type        = string
  default     = "slb.s1.small"
}

variable "listeners" {
  description = "A list of listener configurations."
  type = list(object({
    protocol      = string
    frontend_port = number
    backend_port  = number
  }))
  default = []
}

variable "backend_server_ids" {
  description = "A list of ECS instance IDs to add to the backend server group."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the SLB."
  type        = map(string)
  default     = {}
}