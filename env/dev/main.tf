module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
  env        = "dev"
}

module "networking" {
  source          = "../../modules/networking"
  nat_count       = 1
  public_subnets  = module.vpc.public_subnets
}

module "alb" {
  source          = "../../modules/alb"
  name            = "dev-alb"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
}

module "ecs" {
  source          = "../../modules/ecs"
  env             = "dev"
  task_count      = 1
  memory          = 2048
  image           = "nginx"
  private_subnets = module.vpc.private_subnets
  tg_arn          = module.alb.target_group_arn
}

module "rds" {
  source          = "../../modules/rds"
  env             = "dev"
  instance_type   = "db.t2.small"
  storage         = 50
  private_subnets = module.vpc.private_subnets
}

module "bastion" {
  source = "../../modules/ec2"

  env            = "dev"
  vpc_id         = module.vpc.vpc_id
  public_subnet  = module.vpc.public_subnets[0]

  instance_type  = "t2.micro"
  ami            = "ami-0f58b397bc5c1f2e8"  # Amazon Linux (Mumbai)
  key_name       = "your-keypair"

  allowed_ips = ["YOUR_IP/32"]
}