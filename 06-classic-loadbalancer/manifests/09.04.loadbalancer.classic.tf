module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "4.0.2"

  name = local.elb_name

  subnets         = module.vpc.public_subnets
  security_groups = [module.security_group_public_loadbalancer.security_group_id]
  internal        = false

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "http"
      lb_port           = "80"
      lb_protocol       = "http"
    },
    {
      instance_port     = "80"
      instance_protocol = "http"
      lb_port           = "81"
      lb_protocol       = "http"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  /* access_logs = {
    bucket = module.log_bucket.s3_bucket_id
  } */

  tags = local.elb_tags

  # ELB attachments
  number_of_instances = length(module.ec2_private_instance)
  instances           = [for ec2 in module.ec2_private_instance : ec2.id]
}
