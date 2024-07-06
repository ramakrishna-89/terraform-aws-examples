resource "aws_route53_record" "cv_domain_registration" {
  zone_id = data.aws_route53_zone.cv_domain.zone_id
  name    = data.aws_route53_zone.cv_domain.name
  type    = "A"
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "cv_subdomain_videos" {
  zone_id = data.aws_route53_zone.cv_domain.zone_id
  name    = "aws-videos.${data.aws_route53_zone.cv_domain.name}"
  type    = "A"
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}


output "route53_op_01" {
  value = data.aws_route53_zone.cv_domain.zone_id
}

output "route53_op_02" {
  value = data.aws_route53_zone.cv_domain.name
}

output "route53_op_03" {
  value = module.alb.dns_name
}

output "route53_op_04" {
  value = module.alb.zone_id
}
