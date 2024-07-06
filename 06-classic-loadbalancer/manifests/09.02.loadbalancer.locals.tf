locals {
  elb_name = "${local.name_prefix}-${var.elb_name}"
  elb_tags = merge({ Name : local.elb_name }, local.global_tags)
}
