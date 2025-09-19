# modules/sls/main.tf

terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.220.0"
    }
  }
}

# 1. Main container for all logs
resource "alicloud_log_project" "project" {
  name        = var.project_name
  description = "SLS Project for ${var.project_name}"
}

# 2. Storage for a specific type of log
resource "alicloud_log_store" "logstore" {
  project           = alicloud_log_project.project.name
  name              = var.logstore_name
  retention_period  = var.log_retention_period
  shard_count       = 2
}

# 3. A group of servers that will send logs (NAYA ARGUMENT ISTEMAL HUA HAI)
resource "alicloud_log_machine_group" "machine_group" {
  project       = alicloud_log_project.project.name
  name          = var.machine_group_name
  identify_type = "userdefined"
  topic         = "app-logs"
  identify_list = var.machine_group_userdefined_ids # Purane 'userdefined_ids' ki jagah
}

# 4. Instructions for the servers
resource "alicloud_logtail_config" "logtail_config" {
  project      = alicloud_log_project.project.name
  logstore     = alicloud_log_store.logstore.name
  name         = var.logtail_config_name
  input_type   = "file"
  output_type  = "LogService"

  input_detail = <<EOF
  {
    "logType": "common_reg_log",
    "logPath": "${var.log_file_path}",
    "filePattern": "*.log",
    "topicFormat": "none"
  }
  EOF
}

# 5. Attach the config to the machine group (DOBARA ALAG RESOURCE BANAYA GAYA HAI)
resource "alicloud_logtail_attachment" "attachment" {
  project             = alicloud_log_project.project.name
  logtail_config_name = alicloud_logtail_config.logtail_config.name
  machine_group_name  = alicloud_log_machine_group.machine_group.name
}