module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = local.vpc_name
  cidr = var.vpc_cidr
  azs  = local.vpc_azs

  private_subnets     = var.vpc_private_subnet
  private_subnet_tags = local.vpc_private_subnet_tags

  public_subnets     = var.vpc_public_subnet
  public_subnet_tags = local.vpc_public_subnet_tags

  database_subnets                       = var.vpc_databse_subnet
  database_subnet_tags                   = local.vpc_database_subnet_tags
  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = false
  create_database_nat_gateway_route      = false

  manage_default_network_acl    = false
  manage_default_route_table    = false
  manage_default_security_group = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = local.vpc_tags
}

output "vpc_database_subnets" {
  value = module.vpc.database_subnets
}
