resource "aws_autoscaling_group" "asg-01" {
  name_prefix               = local.asg_name
  desired_capacity          = 2
  max_size                  = 10
  min_size                  = 2
  health_check_grace_period = 300 #300 is default
  health_check_type         = "EC2"
  force_delete              = true
  vpc_zone_identifier       = module.vpc.private_subnets
  target_group_arns         = [module.alb.target_groups["tg-01"].arn]

  launch_template {
    id      = aws_launch_template.base_template.id
    version = aws_launch_template.base_template.latest_version
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      #instance_warmup        = 300 #health_check_grace_period value is default
      min_healthy_percentage = 50
    }
    triggers = ["desired_capacity"] #any argument of asg, if the given value of the argument changes then the ASG will refresh instances
  }
  tag {
    key                 = "owner"
    value               = "dev-team"
    propagate_at_launch = true
  }


}
