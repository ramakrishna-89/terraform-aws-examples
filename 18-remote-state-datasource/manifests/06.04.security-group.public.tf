module "security_group_public" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name   = local.sg_public_name
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  tags   = local.sg_public_tags

  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = [var.internet_cidr]

  egress_rules = ["all-all"]
}
