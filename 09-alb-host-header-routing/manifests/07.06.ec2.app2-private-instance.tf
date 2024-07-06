module "ec2_private_instance_app2" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  depends_on = [module.vpc]

  name = "${local.ec2_private_instance_name}-app2"
  tags = merge({
    Name = "${local.ec2_private_instance_name}-app2"
  }, local.global_tags)

  ami                    = data.aws_ami.amznlnx2.id
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_instance_keypair
  vpc_security_group_ids = [module.security_group_private.security_group_id]
  user_data              = file("${path.module}/app/app2.install.sh")
  for_each               = { for i, az in local.aws_azs_filtered : i => az }
  subnet_id              = element(module.vpc.private_subnets, each.key)

}


