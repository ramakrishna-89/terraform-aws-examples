locals {
  vpc_name                 = "${local.name_prefix}-${var.vpc_name}"
  vpc_azs                  = local.aws_azs_filtered
  vpc_tags                 = local.global_tags
  vpc_private_subnet_tags  = { Name = "${local.vpc_name}-private-subnet" }
  vpc_public_subnet_tags   = { Name = "${local.vpc_name}-public-subnet" }
  vpc_database_subnet_tags = { Name = "${local.vpc_name}-database-subnet" }
}
