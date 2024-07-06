#aws ec2 describe-instance-type-offerings --location-type availability-zone  --filters Name=instance-type,Values=t2.micro --region ap-south-1 --output table
data "aws_ec2_instance_type_offerings" "apsouth_zone_instances_1" {
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }

  filter {
    name   = "location"
    values = ["ap-south-1a"]
  }

  location_type = "availability-zone"
}

output "apsouth_zone_instances_op_1_1" {
  value = data.aws_ec2_instance_type_offerings.apsouth_zone_instances_1.instance_types
}