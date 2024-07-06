resource "aws_cloudwatch_log_group" "cis_security_group" {
  name = "cis-security-log-group-${random_pet.this.id}"
}


module "cloudwatch_cis-alarms" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/cis-alarms"
  version = "5.4.0"

  #create = false # This will disable the alarms creation
  disabled_controls = ["DisableOrDeleteCMK", "VPCChanges"]
  log_group_name    = aws_cloudwatch_log_group.cis_security_group.name
  alarm_actions     = [aws_sns_topic.rasg_sns_topic.arn]
  tags              = local.global_tags
}
