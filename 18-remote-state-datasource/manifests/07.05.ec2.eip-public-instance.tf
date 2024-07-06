resource "aws_eip" "ec2_eip_public_instance" {
  depends_on = [
    module.ec2_public_instance
  ]
  instance = module.ec2_public_instance.id
  domain   = "vpc"
  tags     = local.global_tags

}
