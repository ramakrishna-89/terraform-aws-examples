output "ec2_bastion_instance_id" {
  value = module.ec2_bastion_instance.id
}

output "ec2_bastion_instance_public_ip" {
  value = module.ec2_bastion_instance.public_ip
}

output "ec2_private_instance_id" {
  value = [for i in module.ec2_private_instance : i.id]
}

output "ec2_private_instance_public_ip" {
  value = [for i in module.ec2_private_instance : i.public_ip]
}
