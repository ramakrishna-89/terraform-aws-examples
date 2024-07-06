terraform {
  required_version = "1.8.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.53"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }

  backend "s3" {
    bucket         = "dev-tf-remote-state-storage-and-datasource-01"
    key            = "dev/18-remote-state-datasource/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "18-remote-state-datasource"
  }

}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "random_pet" "this" {
  length = 2
}
