module "my_aws_s3_module" {
  source      = "./modules/aws-s3-bucket"
  bucket_name = var.my_module_bucket_name
  tags        = var.my_module_tags
}
