#Output - For loop with list
output "output_list" {
  description = "For loop with list"
  value       = [for inst in aws_instance.dev-vms : inst.public_ip]
}

#Output - For loop with map
output "output_map_1" {
  description = "For loop with Map1"
  value = {for inst in aws_instance.dev-vms: inst.id => inst.public_dns}
}

#Output - For loop with map
output "output_map_2" {
  description = "For loop with Map1"
  value = {for c, instance in aws_instance.dev-vms: c => instance.public_dns}
}

#Splat will not work with foreach in instance
/*
#Output - Legacy Splat Operator
output "output_legacy_splat_operator" {
  description = "Legacy Splat Operator"
  value = aws_instance.dev-vms.*.public_dns
}

#Output - General Splat Operator
output "output_general_splat_operator" {
  description = "General Splat Operator"
  value = aws_instance.dev-vms[*].public_dns
}

#Output - General Splat Operator
output "output_general_splat_operator_ip" {
  description = "General Splat Operator - IP"
  value = aws_instance.dev-vms[*].public_ip
}
*/

