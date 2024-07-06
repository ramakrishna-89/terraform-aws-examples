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

variable "ec2_private_instance_count" {
  type    = number
  default = 1
}

variable "ec2_instance_count" {
  type = list(string)
}
