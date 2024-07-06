locals {
  name_prefix = "${var.environment}-${var.project}"
  global_tags = {
    Organization = var.organization
    Author       = var.author
  }
}
