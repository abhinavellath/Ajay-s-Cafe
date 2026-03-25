module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.1.0.0/16"
  env        = "prod"
}

module "networking" {
  source          = "../../modules/networking"
  nat_count       = 2
  public_subnets  = module.vpc.public_subnets
}

module "alb" {
  source          = "../../modules/alb"
  name            = "prod-alb"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
}

module "ecs" {
  source          = "../../modules/ecs"
  env             = "prod"
  task_count      = 5
  memory          = 2048
  image           = "nginx"
  private_subnets = module.vpc.private_subnets
  tg_arn          = module.alb.target_group_arn
}

module "rds" {
  source          = "../../modules/rds"
  env             = "prod"
  instance_type   = "db.m7i.large"
  storage         = 100
  private_subnets = module.vpc.private_subnets
}