terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3" {
    bucket         = "hotc-terraform-state"
    key            = "core/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "hotc-terraform-locks"
  }
}

provider "aws" {
  region = "us-east-1"
}