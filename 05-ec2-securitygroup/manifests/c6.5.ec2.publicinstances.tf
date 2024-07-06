module "ec2_bastion_instance" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name = local.ec2_bastion_instance_name
  tags = merge({
    Name = "${local.ec2_bastion_instance_name}"
  }, local.global_tags)

  ami                    = data.aws_ami.amznlnx2.id
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_instance_keypair
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.sg_public_bastion.security_group_id]

}


