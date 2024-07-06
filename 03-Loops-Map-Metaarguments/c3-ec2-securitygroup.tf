resource "aws_security_group" "dev-vpc-ssh" {
  description = "dev-vpc-ssh"
  name        = "dev-vpc-ssh"
  tags = {
    Name = "dev-vpc-ssh"
  }

  ingress {
    description = "Inbound - Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound - Allow all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "dev-vpc-web" {
  description = "Allow port 80"
  name        = "dev-vpc-web"
  tags = {
    Name = "dev-vpc-web"
  }

  ingress {
    description = "Inbound - Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound - Allow all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
