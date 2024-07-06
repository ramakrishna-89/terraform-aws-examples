variable "vpc_name" {
  type    = string
  default = "vpc"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.10.0.0/16"
}

variable "vpc_availability_zones" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "vpc_private_subnets" {
  type    = list(string)
  default = ["10.10.1.0/24", "10.10.10.0/24"]
}

variable "vpc_public_subnets" {
  type    = list(string)
  default = ["10.10.2.0/24", "10.10.20.0/24"]
}

variable "vpc_database_subnets" {
  type    = list(string)
  default = ["10.10.3.0/24", "10.10.30.0/24"]
}

variable "vpc_enable_nat_gateway" {
  type    = bool
  default = false
}

variable "vpc_single_nat_gateway" {
  type    = bool
  default = false
}

variable "vpc_create_database_subnet_group" {
  type    = bool
  default = false
}

variable "vpc_create_database_subnet_route_table" {
  type    = bool
  default = false
}

variable "vpc_create_database_nat_gateway_route" {
  type    = bool
  default = false
}

variable "vpc_create_database_internet_gateway_route" {
  type    = bool
  default = false
}

variable "vpc_enable_dns_hostnames" {
  type    = bool
  default = false
}
variable "vpc_enable_dns_support" {
  type    = bool
  default = false
}
