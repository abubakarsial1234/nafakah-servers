variable "vpc_id" {
  description = "The ID of the VPC where the vSwitch exists."
  type        = string
}
variable "availability_zone" {
  description = "The availability zone of the vSwitch."
  type        = string
}
variable "vswitch_cidr" {
  description = "The CIDR block of the existing vSwitch."
  type        = string
}