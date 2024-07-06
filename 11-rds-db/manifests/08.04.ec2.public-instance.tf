module "ec2_public_instance" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name                   = local.ec2_public_instance_name
  ami                    = data.aws_ami.amznlnx2.id
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_instance_keypair
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.security_group_public.security_group_id]

  user_data = file("${path.module}/app/jumpbox.install.sh")

  tags = merge({
    Name = "${local.ec2_public_instance_name}"
  }, local.global_tags)

}


