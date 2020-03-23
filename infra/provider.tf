provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = "/root/.aws/credentials"
  profile                 = "default"
}

terraform {
  backend "s3" {
    key = "infra-state"
    encrypt = "true"
  }
}