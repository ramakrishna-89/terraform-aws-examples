module "sg_private" {

  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name = local.sg_private_name
  tags = merge({
    Name = "${local.sg_private_name}"
  }, local.global_tags)

  vpc_id = module.vpc.vpc_id

  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  egress_rules = ["all-all"]

}
