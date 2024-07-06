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
              values = ["/*"]
            }
          }]
        }
      }
    }


  }
}