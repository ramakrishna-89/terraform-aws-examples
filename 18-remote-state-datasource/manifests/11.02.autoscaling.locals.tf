locals {
  lt_name        = "${local.name_prefix}-${var.lt_name}"
  lt_tags        = merge({ Name : local.lt_name }, local.global_tags)
  asg_name       = "${local.name_prefix}-${var.asg_name}"
  asg_tags       = merge({ Name : local.asg_name }, local.global_tags)
  sns_topic_name = "${local.name_prefix}-${var.sns_topic_name}"
}
