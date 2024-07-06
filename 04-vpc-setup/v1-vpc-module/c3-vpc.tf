module "dev-vpc-01" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "dev-vpc-01"
  cidr = "10.0.0.0/16"
  azs  = ["ap-south-1a, ap-south-1b"]
  vpc_tags = {
    Name = "dev-vpc-01"
  }

  private_subnets    = ["10.20.1.0/24", "10.20.2.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  private_subnet_tags = {
    Type = "dev-private-subnet"
  }

  public_subnets = ["10.30.1.0/24", "10.30.2.0/24"]
  public_subnet_tags = {
    Type = "dev-public-subnet"
  }

  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  database_subnets                       = ["10.40.1.0/24", "10.40.2.0/24"]
  create_database_internet_gateway_route = false
  create_database_nat_gateway_route      = false
  database_subnet_tags = {
    Type = "dev-database-subnet"
  }

  #DNS
  enable_dns_hostnames = true
  enable_dns_support   = true

  #Global Tags
  tags = {
    Owner       = "Ramakrishna"
    Environment = "dev-01"
  }
}
