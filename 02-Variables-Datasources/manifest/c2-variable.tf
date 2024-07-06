variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "ap-south-1"
}

variable "aws_profile" {
  description = "AWS Profile"
  type = string
  default = "default"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

variable "instance_keypair" {
  description = "The Keypair to assign to EC2"
  type = string
  default = "terraform-key"
}