locals {
  sg_public_name              = "${local.name_prefix}-${var.sg_public_name}"
  sg_public_tags              = merge({ Name : local.sg_public_name }, local.global_tags)
  sg_private_name             = "${local.name_prefix}-${var.sg_private_name}"
  sg_private_tags             = merge({ Name : local.sg_private_name }, local.global_tags)
  sg_public_loadbalancer_name = "${local.name_prefix}-${var.sg_public_loadbalancer_name}"
  sg_public_loadbalancer_tags = merge({ Name : local.sg_public_loadbalancer_name }, local.global_tags)
}

