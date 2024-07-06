data "aws_ec2_instance_type_offerings" "apsouth_zone_instances_2" {
  for_each = toset(["ap-south-1a", "ap-south-1b", "ap-south-1c"])
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}

output "apsouth_zone_instances_op_2_1" {
  value = [for t in data.aws_ec2_instance_type_offerings.apsouth_zone_instances_2 : t.instance_types]
}

output "apsouth_zone_instances_op_2_2" {
  value = { for key, value in data.aws_ec2_instance_type_offerings.apsouth_zone_instances_2 : key => value.instance_types }
}
