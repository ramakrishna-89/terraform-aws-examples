#Resources
resource "aws_instance" "dev-vm-01" {
  ami           = "ami-013e83f579886baeb"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/app1.install.sh")
  tags = {
    Name = "EC2 Demo Sec 01"
  }
}
