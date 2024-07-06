resource "aws_eip" "ec2_eip_bastion_instance" {
  depends_on = [
    module.ec2_bastion_instance,
    module.vpc
  ]
  instance = module.ec2_bastion_instance.id
  domain   = "vpc"
  tags     = local.global_tags

}
