module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = var.cidr_block
  env        = var.env
}

module "networking" {
  source         = "../../modules/networking"
  nat_count      = var.nat_count
  public_subnets = module.vpc.public_subnets
}

module "alb" {
  source         = "../../modules/alb"
  name           = var.alb_name
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "ecs" {
  source          = "../../modules/ecs"
  env             = var.env
  task_count      = var.ecs_task_count
  memory          = var.ecs_memory
  image           = var.ecs_image
  private_subnets = module.vpc.private_subnets
  tg_arn          = module.alb.target_group_arn
}

module "rds" {
  source          = "../../modules/rds"
  env             = var.env
  instance_type   = var.db_instance_type
  storage         = var.db_storage
  private_subnets = module.vpc.private_subnets
}

module "bastion" {
  source = "../../modules/ec2"   

  env            = var.env
  vpc_id         = module.vpc.vpc_id
  public_subnet  = module.vpc.public_subnets[0]

  instance_type  = var.bastion_instance_type
  ami            = var.bastion_ami
  key_name       = var.key_name

  allowed_ips    = var.allowed_ips
}