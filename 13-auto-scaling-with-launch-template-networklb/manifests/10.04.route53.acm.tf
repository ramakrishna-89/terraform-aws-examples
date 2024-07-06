module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "5.0.1"

  domain_name = trimsuffix(data.aws_route53_zone.cv_domain.name, ".")
  zone_id     = data.aws_route53_zone.cv_domain.zone_id

  subject_alternative_names = [
    "*.${data.aws_route53_zone.cv_domain.name}"
  ]

  validation_method   = "DNS"
  wait_for_validation = true
  tags                = local.route53_acm_tags
}
