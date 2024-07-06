data "aws_ec2_instance_type_offerings" "aws_ec2_offerings" {
  for_each = toset(data.aws_availability_zones.aws_azs.names)

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

locals {
  aws_azs_filtered = tolist(keys({
    for k, v in data.aws_ec2_instance_type_offerings.aws_ec2_offerings :
    k => v.instance_types if length(v.instance_types) != 0
  }))
}

output "aws_azs_filtered" {
  value = local.aws_azs_filtered
}
