# modules/sls/variables.tf

variable "project_name" {
  description = "Name for the SLS Project (must be globally unique)."
  type        = string
}

variable "logstore_name" {
  description = "Name for the Logstore within the project."
  type        = string
}

variable "log_retention_period" {
  description = "How many days to keep the logs."
  type        = number
  default     = 30
}

variable "machine_group_name" {
  description = "Name for the group of machines sending logs."
  type        = string
}

variable "machine_group_userdefined_ids" {
  description = "A list of custom IDs to identify machines in the group for the 'identify_list' argument."
  type        = list(string)
  default     = []
}

variable "logtail_config_name" {
  description = "Name for the log collection configuration."
  type        = string
}

variable "log_file_path" {
  description = "The absolute path of the directory containing log files on the server (e.g., /var/log/app/)."
  type        = string
}