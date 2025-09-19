# live/dev/terragrunt.hcl

remote_state {
  backend = "oss"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "nafakah-tfstatefile-storage-files"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "me-central-1" # Aapka region
    acl            = "private"
    encrypt        = true # Security ke liye hamesha encryption on rakhein
  }
}