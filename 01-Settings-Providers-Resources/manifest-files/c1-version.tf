#Terraform Block
terraform {
  required_version = "~> 1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49"
    }
  }
}

#Provider Block
#From aws client profile terraform takes the default profile credientials, If no profile defined.
provider "aws" {
  region = "ap-south-1"
  profile = "default"
}