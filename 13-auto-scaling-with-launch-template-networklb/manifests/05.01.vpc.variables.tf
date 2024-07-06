variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_private_subnet" {
  type = list(string)
}

variable "vpc_public_subnet" {
  type = list(string)
}

variable "vpc_databse_subnet" {
  type = list(string)
}
