variable "aws-region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "aws-profile" {
  type    = string
  default = "default"
}

variable "bucket_name" {
  type = string
}

variable "tags" {
  type = map(string)
}
