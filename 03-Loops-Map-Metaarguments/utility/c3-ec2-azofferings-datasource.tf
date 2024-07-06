data "aws_availability_zones" "apsouth_zones_3" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ec2_instance_type_offerings" "apsouth_zone_instances_3" {
  for_each = toset(data.aws_availability_zones.apsouth_zones_3.names)
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

output "apsouth_zone_instances_op_3_1" {
  value = { for key, value in data.aws_ec2_instance_type_offerings.apsouth_zone_instances_3 : key => value.instance_types }
}

output "apsouth_zone_instances_op_3_2" {
  value = { for key, value in data.aws_ec2_instance_type_offerings.apsouth_zone_instances_3 :
    key => value.instance_types if length(value.instance_types) != 0
  }
}

output "apsouth_zone_instances_op_3_3" {
  value = keys({ for key, value in data.aws_ec2_instance_type_offerings.apsouth_zone_instances_3 :
    key => value.instance_types if length(value.instance_types) != 0
  })
}
