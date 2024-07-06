locals {
  vpc_tags = { Name = "${local.name}-${var.vpc_name}" }
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name     = "${local.name}-${var.vpc_name}"
  cidr     = var.vpc_cidr_block
  azs      = var.vpc_availability_zones
  vpc_tags = local.vpc_tags

  private_subnets    = var.vpc_private_subnets
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway
  private_subnet_tags = {
    Type = "dev-private-subnet"
  }

  public_subnets = var.vpc_public_subnets
  public_subnet_tags = {
    Type = "dev-public-subnet"
  }

  create_database_subnet_group           = var.vpc_create_database_subnet_group
  create_database_subnet_route_table     = var.vpc_create_database_subnet_route_table
  database_subnets                       = var.vpc_database_subnets
  create_database_internet_gateway_route = false
  create_database_nat_gateway_route      = false
  database_subnet_tags = {
    Type = "dev-database-subnet"
  }

  #DNS
  enable_dns_hostnames = true
  enable_dns_support   = true

  #Global Tags
  tags = local.common_tags
}
