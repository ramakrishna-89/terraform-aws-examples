locals {
  owners      = var.department
  environment = var.environment
  name        = "${var.environment}-${var.department}"
  #name       = "${local.environment}-${local.owners}"
  common_tags = {
    org    = var.organization
    owner  = var.department
    author = var.author
  }
}
