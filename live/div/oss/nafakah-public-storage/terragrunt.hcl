terraform {
  source = "../../../../modules/oss"
}

inputs = {
  bucket_name = "nafakah-public-dev-app-storage"

  acl = "public-read"

  enable_versioning = true

  tags = {
    Environment = "dev"
    Project     = "Nafakah"
  }
}
