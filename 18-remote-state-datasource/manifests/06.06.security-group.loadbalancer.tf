module "security_group_loadbalancer" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name   = local.sg_public_loadbalancer_name
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  tags   = local.sg_public_loadbalancer_tags

  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = [var.internet_cidr]

  ingress_with_cidr_blocks = [
    {
      from_port   = 81
      to_port     = 81
      protocol    = 6
      description = "Allow port 81"
      cidr_blocks = "0.0.0.0/16"
    }
  ]

  egress_rules = ["all-all"]
}
