module "db_secret" {
  source = "../../modules/secrets-manager"

  secret_name = "${var.env}-db-credentials"
  env         = var.env

  secret_data = {
    username = var.db_username
    password = var.db_password
  }
}