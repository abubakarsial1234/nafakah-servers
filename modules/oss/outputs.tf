output "bucket_name" {
  description = "The name of the bucket."
  value       = alicloud_oss_bucket.bucket.bucket
}

output "bucket_endpoint" {
  description = "The public endpoint of the bucket."
  value       = alicloud_oss_bucket.bucket.extranet_endpoint
}

output "bucket_internal_endpoint" {
  description = "The internal (VPC) endpoint of the bucket."
  value       = alicloud_oss_bucket.bucket.intranet_endpoint
}