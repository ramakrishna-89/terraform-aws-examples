resource "aws_instance" "dev-vms" {
  ami = data.aws_ami.amznlnx2.id
  #instance_type = var.instance_type
  instance_type = var.instance_type_list[0] #List E.G
  #instance_type = var.instance_type_map["dev"] #Map E.G
  user_data = file("${path.module}/app/app1.install.sh")
  key_name  = var.instance_keypair
  vpc_security_group_ids = [
    aws_security_group.dev-vpc-ssh.id,
    aws_security_group.dev-vpc-web.id
  ]
  #for_each          = toset(data.aws_availability_zones.apsouth_zones.names)
  for_each = toset(keys({ for az, instance in data.aws_ec2_instance_type_offerings.apsouth_zone_instances :
    az => instance.instance_types if length(instance.instance_types) != 0
  }))
  availability_zone = each.key
  #count = 2 #will create 2 instance
  tags = {
    #Name = "dev-vm-${count.index}"
    Name = "dev-vm-${each.key}"
  }
}
