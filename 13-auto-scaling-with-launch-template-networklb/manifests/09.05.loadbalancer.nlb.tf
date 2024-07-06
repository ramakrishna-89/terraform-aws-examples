module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.9.0"

  name_prefix                      = "rnlb-"
  load_balancer_type               = var.alb_type
  vpc_id                           = module.vpc.vpc_id
  subnets                          = module.vpc.public_subnets
  security_groups                  = [module.security_group_loadbalancer.security_group_id]
  tags                             = local.alb_tags
  enable_deletion_protection       = false # if true then terraform destroy will not be able to delete, but true for prod
  dns_record_client_routing_policy = "availability_zone_affinity"

  #Target Groups
  target_groups = {
    tg-01 = {
      create_attachment                 = false #param will not be there in module readme, check the issue link in google to attach more instance to a TG
      name_prefix                       = "tg-01-"
      protocol                          = "TCP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
      }
      tags = local.global_tags
    }
  }

  #Listenrs
  listeners = {
    nlb-tcp-listner = {
      port     = 80
      protocol = "TCP"
      forward = {
        target_group_key = "tg-01"
      }
    }

    nlb-tls-listner = {
      port            = 443
      protocol        = "TLS"
      certificate_arn = module.acm.acm_certificate_arn
      forward = {
        target_group_key = "tg-01"
      }

    }


  }
}
