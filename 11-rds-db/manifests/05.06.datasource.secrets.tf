data "aws_secretsmanager_secret" "data_password_manager_key" {
  name = "dev-rds-password"
}

data "aws_secretsmanager_secret_version" "data_dev_rds_password" {
  secret_id = data.aws_secretsmanager_secret.data_password_manager_key.id
}
