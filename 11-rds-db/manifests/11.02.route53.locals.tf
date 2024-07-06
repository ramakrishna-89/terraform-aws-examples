locals {
  route53_name     = "${local.name_prefix}-${var.route53_name}"
  route53_tags     = merge({ Name : local.route53_name }, local.global_tags)
  route53_acm_name = "${local.name_prefix}-${var.route53_acm_name}"
  route53_acm_tags = merge({ Name : local.route53_acm_name }, local.global_tags)
}
