# live/dev/oss-backend/terragrunt.hcl

terraform {
  source = "../../../modules/oss" # Aapka pehle se banaya hua OSS module
}

inputs = {
  bucket_name       = "nafakah-tfstatefile-storage-files"
  acl               = "private"  # State files hamesha private honi chahiye
  enable_versioning = true       # Backup ke liye versioning bohot zaroori hai
  tags = {
    Purpose     = "Terraform-Backend"
    Environment = "dev"
    Project     = "Nafakah"
  }
}