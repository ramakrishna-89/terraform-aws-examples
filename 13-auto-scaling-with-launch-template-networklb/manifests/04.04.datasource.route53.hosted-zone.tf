data "aws_route53_zone" "cv_domain" {
  name = "cvltd.org"
}

output "cv_domain_zone_id" {
  value = data.aws_route53_zone.cv_domain.zone_id
}
