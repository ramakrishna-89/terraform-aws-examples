module "security_group_private" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name   = local.sg_private_name
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  tags   = local.sg_private_tags

  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [data.terraform_remote_state.vpc.outputs.custom_output_vpc_cidr_block]

  egress_rules = ["all-all"]
}
