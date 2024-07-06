output "sg_public_bastion_name" {
  description = "The name of the security group"
  value       = module.sg_public_bastion.security_group_name
}

output "sg_public_bastion_id" {
  description = "The ID of the security group"
  value       = module.sg_public_bastion.security_group_id
}

output "sg_public_bastion_vpc_id" {
  description = "The VPC ID"
  value       = module.sg_public_bastion.security_group_vpc_id
}

output "sg_private_name" {
  description = "The name of the security group"
  value       = module.sg_private.security_group_name
}

output "sg_private_id" {
  description = "The ID of the security group"
  value       = module.sg_private.security_group_id
}

output "sg_private_vpc_id" {
  description = "The VPC ID"
  value       = module.sg_private.security_group_vpc_id
}


