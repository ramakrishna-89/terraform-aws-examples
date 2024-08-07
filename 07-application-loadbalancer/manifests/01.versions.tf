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
  }

}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
