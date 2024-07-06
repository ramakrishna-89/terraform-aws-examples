# Null Resource
resource "null_resource" "null_resource" {
  depends_on = [module.ec2_bastion_instance]
  connection {
    type        = "ssh"
    host        = aws_eip.ec2_eip_bastion_instance.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("key/terraform-key.pem")
  }

  # File provisioner
  provisioner "file" {
    source      = "key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }

  #Remote Exec provisioner
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }

  # Local Exec provisioner
  provisioner "local-exec" {
    working_dir = "local-exec-files"
    command     = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> vpc-creation-stamp.txt"
    #on_failure = continue
  }

  # Local Exec - creation time provisioner
  provisioner "local-exec" {
    working_dir = "local-exec-files"
    command     = "echo creation stamp `date` >> creation-stamp.txt"
    when        = create # default option (creation time provisioner)
    #on_failure = continue
  }

  /* # Local Exec - destroy time provisioner
  provisioner "local-exec" {
    working_dir = "local-exec-files"
    command     = "echo destroy stamp `date` >> destroy-stamp.txt"
    when        = destroy
    #on_failure = continue
  } */
}




