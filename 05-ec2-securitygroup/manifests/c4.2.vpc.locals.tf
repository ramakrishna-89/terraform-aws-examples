locals {
  vpc_tags = {
    Name         = "${local.name_prefix}-${var.vpc_name}"
    organization = var.organization
    author       = var.author
    environment  = var.environment
  }
  vpc_private_subnet_tags = {
    Name        = "${local.name_prefix}-${var.vpc_name}-private-subnet"
    environment = var.environment
  }
  vpc_public_subnet_tags = {
    Name        = "${local.name_prefix}-${var.vpc_name}-public-subnet"
    environment = var.environment
  }
  vpc_database_subnet_tags = {
    Name        = "${local.name_prefix}-${var.vpc_name}-database-subnet"
    environment = var.environment
  }
}
