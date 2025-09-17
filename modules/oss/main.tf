resource "alicloud_oss_bucket" "bucket" {
  bucket        = var.bucket_name
  acl           = var.acl
  storage_class = var.storage_class

  versioning {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }

  tags = var.tags
}