data "aws_availability_zones" "aws_azs" {

  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
