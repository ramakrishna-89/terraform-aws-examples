locals {
  sg_name_prefix  = "${local.name_prefix}-${var.sg_name}"
  sg_bastion_name = "${local.sg_name_prefix}-bastion"
  sg_private_name = "${local.sg_name_prefix}-private"
}
