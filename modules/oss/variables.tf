variable "bucket_name" {
  description = "The name of the OSS bucket. This name must be globally unique."
  type        = string
}

variable "acl" {
  description = "The access control list for the bucket (e.g., 'private', 'public-read')."
  type        = string
  default     = "private"
}

variable "storage_class" {
  description = "The storage class of the bucket (e.g., 'Standard', 'IA', 'Archive')."
  type        = string
  default     = "Standard"
}

variable "enable_versioning" {
  description = "Set to true to enable versioning on the bucket."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}