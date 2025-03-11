output "terraform_state_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  value       = module.terraform_state_bucket.bucket_id
}

output "terraform_state_bucket_arn" {
  description = "ARN of the S3 bucket for Terraform state"
  value       = "arn:aws:s3:::${module.terraform_state_bucket.bucket_id}"
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  value       = aws_dynamodb_table.terraform_locks.name
}

# output "terraform_state_bucket_id" {
#   description = "ID of the S3 bucket for Terraform state"
#   value       = module.terraform_state_bucket.id
# }

output "dynamodb_table_id" {
  description = "ID of the DynamoDB table for state locking"
  value       = aws_dynamodb_table.terraform_locks.id
}