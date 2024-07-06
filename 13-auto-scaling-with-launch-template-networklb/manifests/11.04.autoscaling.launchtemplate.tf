resource "aws_launch_template" "base_template" {
  name_prefix            = local.lt_name
  image_id               = data.aws_ami.amznlnx2.id
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [module.security_group_private.security_group_id]
  key_name               = var.ec2_instance_keypair
  user_data              = filebase64("${path.module}/app/app1.install.sh")
  #ebs_optimized          = true # Not available for free tier
  #default_version        = "1.0"
  update_default_version = true

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = 20
      delete_on_termination = true
      volume_type           = "gp2"
    }
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags          = local.lt_tags
  }


}
