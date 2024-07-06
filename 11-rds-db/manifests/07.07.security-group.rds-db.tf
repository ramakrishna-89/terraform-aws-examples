module "security_group_rds_db" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name   = local.sg_rds_db_name
  vpc_id = module.vpc.vpc_id
  tags   = local.sg_rds_db_tags

  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "Allow access to RDS"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]

  egress_rules = ["all-all"]
}
