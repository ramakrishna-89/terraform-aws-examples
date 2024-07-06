locals {
  rds_name = "${local.name_prefix}-${var.rds_db_name}"
  rds_tags = merge({ Name : local.rds_name }, local.global_tags)

}
