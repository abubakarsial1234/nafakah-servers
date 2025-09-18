terraform {
  source = "../../../../modules/oss"
}

inputs = {
  bucket_name = "nafakah-dev-app-storage" 

  acl = "private"

  enable_versioning = true

  tags = {
    Environment = "dev"
    Project     = "Nafakah"
  }
}