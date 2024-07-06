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

}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "random_pet" "this" {
  length = 2
}
