locals {
  ec2_name_prefix           = "${local.name_prefix}-${var.ec2_name}"
  ec2_public_instance_name  = "${local.ec2_name_prefix}-bastion"
  ec2_private_instance_name = "${local.ec2_name_prefix}-vm"
}
