module "security_group_loadbalancer" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name   = local.sg_public_loadbalancer_name
  vpc_id = module.vpc.vpc_id
  tags   = local.sg_public_loadbalancer_tags

  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = [var.internet_cidr]

  egress_rules = ["all-all"]
}
