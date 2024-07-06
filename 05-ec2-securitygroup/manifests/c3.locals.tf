locals {
  name_prefix = var.environment
  global_tags = {
    organization = var.organization
    author       = var.author
    environment  = var.environment
  }
}
