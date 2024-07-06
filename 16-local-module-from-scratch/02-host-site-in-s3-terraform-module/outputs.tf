# Output variable definitions
output "name" {
  description = "Name (id) of the bucket"
  value       = module.my_aws_s3_module.name
}

output "arn" {
  description = "ARN of the S3 Bucket"
  value       = module.my_aws_s3_module.arn
}

output "bucket_domain_name" {
  description = "Bucket Domain Name of the S3 Bucket"
  value       = module.my_aws_s3_module.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "Regional Domain Name of the S3 Bucket"
  value       = module.my_aws_s3_module.bucket_regional_domain_name
}

# Static Website URL
output "static_website_url" {
  value = module.my_aws_s3_module.static_website_url
}
