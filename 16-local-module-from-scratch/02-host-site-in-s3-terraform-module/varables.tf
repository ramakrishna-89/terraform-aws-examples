variable "my_module_aws-region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "my_module_aws-profile" {
  type    = string
  default = "default"
}

variable "my_module_bucket_name" {
  type = string
}

variable "my_module_tags" {
  type = map(string)
}
