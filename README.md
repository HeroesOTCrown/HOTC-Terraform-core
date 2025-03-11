# HOTC-Terraform-core
Core terraform configs for HOTC org

## Overview
This repository contains Terraform configurations for Heroes of the Crown (HOTC) infrastructure, including:
- S3 bucket for application data
- Terraform state management (in the `terraform-state` directory)

## Repository Structure
```
HOTC-Terraform-core/
├── tf-state-s3/
   ├── main.tf
   ├── variables.tf
   └── outputs.tf
├── main.tf                 # Main infrastructure configuration
├── variables.tf            # Variables for main infrastructure
├── outputs.tf              # Outputs for main infrastructure
├── terraform-state/        # Terraform state management
│   ├── main.tf             # S3 bucket and DynamoDB for state
│   ├── variables.tf        # Variables for state management
│   └── outputs.tf          # Outputs for state management
└── README.md               # This file
```

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
- AWS CLI configured with appropriate credentials
- Access to the user-benjamin Terraform modules

## Getting Started

### Setting Up Terraform State Backend
First, deploy the Terraform state backend:

1. Navigate to the terraform-state directory:
   ```
   cd terraform-state
   ```
2. Initialize Terraform:
   ```
   terraform init
   ```
3. Review and modify variables in `variables.tf` as needed
4. Apply the Terraform configuration:
   ```
   terraform apply
   ```
5. Note the outputs for the S3 bucket name and DynamoDB table name

### Deploying Main Infrastructure
After setting up the state backend:

1. Return to the root directory:
   ```
   cd ..
   ```
2. Update the backend configuration in `main.tf` with the values from the previous step
3. Initialize Terraform with the S3 backend:
   ```
   terraform init
   ```
4. Apply the Terraform configuration:
   ```
   terraform apply
   ```

## Configuration
- Modify `variables.tf` files in each directory to customize:
  - AWS region
  - Bucket names
  - Tags

## Resources Created
- Application S3 bucket with versioning and lifecycle policies
- Terraform state S3 bucket (in terraform-state)
- DynamoDB table for state locking (in terraform-state)

## Maintenance
- Run `terraform plan` before applying changes
- Use `terraform state list` to view managed resources
- Back up your Terraform state regularly
