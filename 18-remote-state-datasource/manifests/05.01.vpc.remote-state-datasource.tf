data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-tf-remote-state-storage-and-datasource-01"
    key    = "dev/17-remote-state-storage/terraform.tfstate"
    region = "ap-south-1"
  }
}
