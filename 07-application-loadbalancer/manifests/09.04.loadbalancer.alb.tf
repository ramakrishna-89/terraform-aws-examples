module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.9.0"

  name                       = local.alb_name
  load_balancer_type         = var.alb_type
  vpc_id                     = module.vpc.vpc_id
  subnets                    = module.vpc.public_subnets
  security_groups            = [module.security_group_loadbalancer.security_group_id]
  tags                       = local.alb_tags
  enable_deletion_protection = false # if true then terraform destroy will not be able to delete

  #Target Groups
  target_groups = {
    tg-instance = {
      create_attachment                 = false #param will not be there in module readme, check the issue link in google to attach more instance to a TG
      name_prefix                       = "h1"
      protocol                          = "HTTP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_algorithm_type     = "weighted_random"
      load_balancing_anomaly_mitigation = "on"
      load_balancing_cross_zone_enabled = false
      protocol_version                  = "HTTP1"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      tags = local.global_tags
    }
  }

  #Listenrs
  listeners = {
    alb-http-listner = {
      port     = 80
      protocol = "HTTP"
      forward = {
        target_group_key = "tg-instance"
      }
    }
  }
}

#instance Attachment to Target group
resource "aws_lb_target_group_attachment" "tg-instance-attachment" {
  for_each         = { for k, v in module.ec2_private_instance : k => v }
  target_group_arn = module.alb.target_groups["tg-instance"].arn
  target_id        = each.value.id
  port             = 80
}

output "tg-instance-attachment_for_each_output" {
  value = { for idx, ec2_details in module.ec2_private_instance : idx => ec2_details }
}
