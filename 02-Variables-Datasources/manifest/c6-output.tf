#EC2 Public IP
output "instance_public_ip" {
  description = "EC2 instance public ip"
  value       = aws_instance.dev-vm-02.public_ip
}

#EC2 Public DNS
output "instance_public_dns" {
  description = "EC2 instance public dns"
  value       = aws_instance.dev-vm-02.public_dns
}
