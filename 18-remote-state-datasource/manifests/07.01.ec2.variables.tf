variable "ec2_name" {
  type    = string
  default = "ec2"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_instance_keypair" {
  type = string
}
