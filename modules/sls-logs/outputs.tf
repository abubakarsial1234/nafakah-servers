# modules/sls/outputs.tf

output "sls_project_name" {
  value = alicloud_log_project.project.name # Purane 'sls_project' ki jagah
}

output "sls_logstore_name" {
  value = alicloud_log_store.logstore.name # Purane 'sls_store' ki jagah
}