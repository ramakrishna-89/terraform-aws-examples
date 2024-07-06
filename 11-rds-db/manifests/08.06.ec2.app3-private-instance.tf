module "ec2_private_instance_app3" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  depends_on = [module.vpc, module.rds_db]

  name = "${local.ec2_private_instance_name}-app3"
  tags = merge({
    Name = "${local.ec2_private_instance_name}-app3"
  }, local.global_tags)

  ami                    = data.aws_ami.amznlnx2.id
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_instance_keypair
  vpc_security_group_ids = [module.security_group_private.security_group_id]
  for_each               = { for i, az in local.aws_azs_filtered : i => az }
  subnet_id              = element(module.vpc.private_subnets, each.key)

  user_data = templatefile("${path.module}/app/app3.install.tmpl", {
    rds_db_endpoint = module.rds_db.db_instance_address
    rds_db_port     = module.rds_db.db_instance_port
    rds_db_name     = module.rds_db.db_instance_name
    rds_db_username = module.rds_db.db_instance_username
    rds_db_password = data.aws_secretsmanager_secret_version.data_dev_rds_password.secret_string
  })

}


