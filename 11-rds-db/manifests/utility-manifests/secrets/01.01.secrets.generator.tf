resource "random_password" "password_generator" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "password_manager_key" {
  name = "dev-rds-password"
}

resource "aws_secretsmanager_secret_version" "dev_rds_password" {
  secret_id     = aws_secretsmanager_secret.password_manager_key.id
  secret_string = random_password.password_generator.result
}
