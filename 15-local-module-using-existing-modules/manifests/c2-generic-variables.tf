variable "organization" {
  description = "Organization Name"
  type        = string
  default     = "r-organization"
}

variable "department" {
  description = "Department Name"
  type        = string
  default     = "eng"
}

variable "environment" {
  description = "Environment variable used as prefix"
  type        = string
  default     = "dev"
}

variable "author" {
  description = "User Details"
  type        = string
}

variable "aws-region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}



variable "aws-profile" {
  type    = string
  default = "default"
}
