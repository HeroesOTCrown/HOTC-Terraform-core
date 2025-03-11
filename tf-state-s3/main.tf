locals {
  bucket_name = "hotc-terraform-state"
  key = "core/terraform.tfstate"
  region = "us-east-1"
  encrypt = true
  dynamodb_table = "hotc-terraform-locks"
}

module "terraform_state_bucket" {
  source      = "github.com/user-benjamin/terraform-aws-s3"
  bucket_name = local.bucket_name
  
  # Enable versioning for state files
  enable_versioning = true
  
  # Block public access
  block_public_access = true
  
  # No lifecycle rules for state files
  enable_lifecycle = false
  
  tags = merge(var.tags, {
    Purpose = "Terraform State"
  })
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = local.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(var.tags, {
    Purpose = "Terraform State Locking"
  })
}