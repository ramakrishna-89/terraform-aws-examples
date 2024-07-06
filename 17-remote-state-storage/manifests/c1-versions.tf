terraform {
  required_version = "~> 1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49"
    }
  }
  backend "s3" {
    bucket         = "dev-tf-remote-state-storage-and-datasource-01"
    key            = "dev/17-remote-state-storage/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "17-remote-state-storage"
  }
}


provider "aws" {
  region  = var.aws-region
  profile = var.aws-profile
}
