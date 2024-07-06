data "aws_availability_zones" "apsouth_zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ec2_instance_type_offerings" "apsouth_zone_instances" {
  for_each = toset(data.aws_availability_zones.apsouth_zones.names)
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

output "apsouth_zone_instances_op_1" {
  value = { for key, value in data.aws_ec2_instance_type_offerings.apsouth_zone_instances : key => value.instance_types }
}

output "apsouth_zone_instances_op_2" {
  value = { for key, value in data.aws_ec2_instance_type_offerings.apsouth_zone_instances :
    key => value.instance_types if length(value.instance_types) != 0
  }
}

output "apsouth_zone_instances_op_3" {
  value = keys({ for key, value in data.aws_ec2_instance_type_offerings.apsouth_zone_instances :
    key => value.instance_types if length(value.instance_types) != 0
  })
}
