resource "aws_autoscaling_policy" "rttsp_avg_cpu_utilization_greater_than_xx" {
  name                      = "rttsp_avg_cpu_utilization_greater_than_xx"
  policy_type               = "TargetTrackingScaling"
  autoscaling_group_name    = aws_autoscaling_group.asg-01.name
  estimated_instance_warmup = 180
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 40.0
  }
}

resource "aws_autoscaling_policy" "rttsp_alb_target_request_greater_than_xx" {
  name                      = "rttsp_alb_target_request_greater_than_xx"
  policy_type               = "TargetTrackingScaling"
  autoscaling_group_name    = aws_autoscaling_group.asg-01.id
  estimated_instance_warmup = 120
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label         = "${module.alb.arn_suffix}/${module.alb.target_groups["tg-01"].arn_suffix}"
    }
    target_value = 10.0
  }
}

output "asg_build_resource_label" {
  value = "${module.alb.arn_suffix}/${module.alb.target_groups["tg-01"].arn_suffix}"
}
