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

variable "instance_keypair" {
  description = "The Keypair to assign to EC2"
  type = string
  default = "terraform-key"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}


variable "instance_type_list" {
  description = "EC2 Instance List"
  type = list(string)
  default = [ "t2.micro","t2.micro" ]
}

variable "instance_type_map" {
  description = "EC2 Instance Map"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa" = "t2.micro"
  }
}
