locals {
  alb_name = "${local.name_prefix}-${var.alb_name}"
  alb_tags = merge({ Name : local.alb_name }, local.global_tags)
}
