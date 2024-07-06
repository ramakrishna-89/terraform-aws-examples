#Increase capacity on peak hours
resource "aws_autoscaling_schedule" "increase_capacity_9am" {
  scheduled_action_name  = "increase_capacity_9am"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 8
  start_time             = "2040-12-11T18:00:00Z" #Provide UTC time
  recurrence             = "00 09 * * *"
  autoscaling_group_name = aws_autoscaling_group.asg-01.id
}

#Decrease capacity on peak hours
resource "aws_autoscaling_schedule" "decrease_capacity_9pm" {
  scheduled_action_name  = "decrease_capacity_9pm"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 4
  start_time             = "2040-12-11T20:00:00Z" #Provide UTC time
  recurrence             = "00 09 * * *"
  autoscaling_group_name = aws_autoscaling_group.asg-01.id
}

