# Topic
resource "aws_sns_topic" "rasg_sns_topic" {
  name = "${local.sns_topic_name}-${random_pet.this.id}"
}

# Subscription
resource "aws_sns_topic_subscription" "rasg_sns_topic_subscription" {
  topic_arn = aws_sns_topic.rasg_sns_topic.arn
  protocol  = "email"
  endpoint  = "ram_r@live.com"
}

resource "aws_autoscaling_notification" "example_notifications" {
  group_names = [
    aws_autoscaling_group.asg-01.id
  ]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.rasg_sns_topic.arn
}
