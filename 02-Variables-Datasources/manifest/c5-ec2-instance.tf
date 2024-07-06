resource "aws_instance" "dev-vm-02" {
  ami           = data.aws_ami.amznlnx2.id
  instance_type = var.instance_type
  user_data     = file("${path.module}/app/app1.install.sh")
  key_name      = var.instance_keypair
  vpc_security_group_ids = [
    aws_security_group.dev-vpc-ssh,
    aws_security_group.dev-vpc-web
  ]
  tags = {
    Name = "EC2 Demo Sec 02"
  }
}