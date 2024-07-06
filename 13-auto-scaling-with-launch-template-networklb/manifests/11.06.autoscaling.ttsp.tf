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

