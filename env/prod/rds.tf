module "rds" {
  source          = "../../modules/rds"
  env             = var.env
  instance_type   = var.db_instance_type
  storage         = var.db_storage
  private_subnets = module.vpc.private_subnets
  engine          = var.engine

  secret_arn = module.db_secret.secret_arn
}