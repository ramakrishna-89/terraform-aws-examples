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
    tg-01 = {
      create_attachment                 = false #param will not be there in module readme, check the issue link in google to attach more instance to a TG
      name_prefix                       = "tg-01-"
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

    tg-02 = {
      create_attachment                 = false #param will not be there in module readme, check the issue link in google to attach more instance to a TG
      name_prefix                       = "tg-02-"
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
        path                = "/app2/index.html"
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
      redirect = {
        port        = 443
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }

    alb-https-listner = {
      port            = 443
      protocol        = "HTTPS"
      ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
      certificate_arn = module.acm.acm_certificate_arn

      fixed_response = {
        content_type = "text/plain"
        message_body = "Request denied - Please use the relevent context paths to access"
        status_code  = "200"
      }

      rules = {
        rule-01-weighted-forward = {
          actions = [{
            type = "weighted-forward"
            target_groups = [
              {
                target_group_key = "tg-01"
                weight           = 1
            }]
            stickiness = {
              enabled  = true
              duration = 3600
            }
          }]
          conditions = [{
            path_pattern = {
              values = ["/app1*"]
            }
          }]
        }
        rule-02-weighted-forward = {
          actions = [{
            type = "weighted-forward"
            target_groups = [
              {
                target_group_key = "tg-02"
                weight           = 1
            }]
            stickiness = {
              enabled  = true
              duration = 3600
            }
          }]
          conditions = [{
            path_pattern = {
              values = ["/app2*"]
            }
          }]
        }
      }
    }


  }
}

#instance Attachment to Target group
resource "aws_lb_target_group_attachment" "tg-01-attachment" {
  for_each         = { for k, v in module.ec2_private_instance_app1 : k => v }
  target_group_arn = module.alb.target_groups["tg-01"].arn
  target_id        = each.value.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg-02-attachment" {
  for_each         = { for k, v in module.ec2_private_instance_app2 : k => v }
  target_group_arn = module.alb.target_groups["tg-02"].arn
  target_id        = each.value.id
  port             = 80
}

output "tg-instance-attachment_for_each_output_01" {
  value = { for idx, ec2_details in module.ec2_private_instance_app1 : idx => ec2_details }
}

output "tg-instance-attachment_for_each_output_02" {
  value = { for idx, ec2_details in module.ec2_private_instance_app2 : idx => ec2_details }
}
