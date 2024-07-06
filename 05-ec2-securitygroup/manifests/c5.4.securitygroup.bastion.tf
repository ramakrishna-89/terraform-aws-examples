module "sg_public_bastion" {

  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name = local.sg_bastion_name
  tags = merge({
    Name = "${local.sg_bastion_name}"
  }, local.global_tags)

  vpc_id = module.vpc.vpc_id

  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules = ["all-all"]

}
